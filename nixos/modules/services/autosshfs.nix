# Configure autofs for mounting sshfs mounts as a specific user.
#
# Heavily inspired by https://github.com/hellekin/autosshfs
{ config, pkgs, lib, ...}: with lib;

let
  cfg = config.pjones.services.autosshfs;
  mkdir = "${pkgs.coreutils}/bin/mkdir";

  ##############################################################################
  # Simple way to get the user whose name is userName.
  getUser = userName: config.users.users."${userName}";

  ##############################################################################
  # Combine all ssh options.
  sshOptions = concatStringsSep " " (map (o: "-o${o}") cfg.sshOptions);

  ##############################################################################
  # Given a username, generate an auto.master(5) line.
  masterLine = userName:
    let user = getUser userName;
        home = user.home;
        uid  = toString user.uid;
        gid  = toString config.users.groups."${userName}".gid;
        ops  = "uid=${uid},gid=${gid},workaround=rename,--timeout=600,--ghost";
        mount = "${home}/${cfg.mountDir}";
    in "${mount} program:${mountOpts userName} ${ops}";

  ##############################################################################
  # Given a username, generate a script that calls ssh.
  sshCommand = userName: pkgs.writeScript "sshfs-exec-${userName}" ''
    #! ${pkgs.stdenv.shell} -eu
    PATH=/run/current-system/sw:/var/setuid-wrappers
    export DISPLAY=:${toString config.services.xserver.display}
    exec sudo -H -u ${userName} -i ssh -a -x ${sshOptions} -2 "$5" -s sftp
  '';

  ##############################################################################
  # Given a username, generate a script that returns mount options.
  mountOpts = userName: pkgs.writeScript "sshfs-options-${userName}" ''
    #! ${pkgs.stdenv.shell} -eu
    OPTS="-fstype=fuse.sshfs,rw,allow_other,umask=077,noatime,nosuid,nodev"
    OPTS="$OPTS,ssh_command=${sshCommand userName}"
    ${if cfg.debug then ''OPTS="$OPTS,debug,sshfs_debug"'' else ""}
    echo -e "$OPTS \t/\t :$1:"
  '';

  ##############################################################################
  # Simple script that creates all necessary directories.
  prepScript = pkgs.writeScript "sshfs-prep"
    ( "#! ${pkgs.stdenv.shell} -eu\n"
    + concatMapStringsSep "\n"
        (u: "${mkdir} -p ${(getUser u).home}/${cfg.mountDir}")
        cfg.users);

  ##############################################################################
  # A package to workaround issues in mount and the sshfs package.
  #
  # This is necessary since the sshfs package does not include a
  # `mount.fuse.sshfs' link.  It's also very helpful because it gives
  # us a chance to strip out the `-n' option that autofs passes to
  # mount, which gets passed on to fuse, and fuse blows up because it
  # doesn't understand `-n'.
  sshfsWrapper = pkgs.stdenv.mkDerivation rec {
    name = "mount.fuse.sshfs";
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin

      cat > $out/bin/${name} <<EOT
      #! ${pkgs.stdenv.shell} -eu
      for arg do
        shift
        [ "\$arg" = "-n" ] && continue
        set -- "\$@" "\$arg"
      done
      exec ${cfg.sshfsPackage}/bin/sshfs "\$@"
      EOT

      chmod 0555 $out/bin/${name}
    '';
  };

in
{
  ###### Interface
  options = {
    pjones.services.autosshfs = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Automatically mount remote sshfs directories.

          Enabling this module is not enough, you also need to set the
          `users' option.
        '';
      };

      users = mkOption {
        type = types.listOf types.str;
        default = [ ];
        example = [ "pjones" ];
        description = ''
          List of users that will have auto-mounting enabled.

          Each use in this list will have an entry in the auto.master
          file so they can mount SSH directories under their home
          directory.

          Don't add `root' to this list!
        '';
      };

      mountDir = mkOption {
        type = types.str;
        default = "mnt/ssh";
        description = ''
          Base mount point under a user's home directory.

          Accessing directories under this path, that are named after
          ssh hosts, will automatically mount them.  The ssh command
          is run inside the corresponding users' environment so their
          ssh config is read and their ssh agent is used.
        '';
      };

      sshOptions = mkOption {
        type = types.listOf types.str;
        default = [ "ClearAllForwardings=yes" "ControlPath=none" ];
        description = "List of options to pass to ssh via the -o flag.";
      };

      sshfsPackage = mkOption {
        type = types.package;
        default = pkgs.sshfsFuse;
        description = "The sshfs package to use.";
      };

      debug = mkOption {
        type = types.bool;
        default = false;
        description = "Enable debug output for autofs.";
      };
    };
  };

  ###### Implementation
  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.fuse sshfsWrapper ];
    services.autofs.enable = true;
    services.autofs.debug = cfg.debug;
    services.autofs.autoMaster = concatStringsSep "\n" (map masterLine cfg.users);

    # Teach autofs where to find sshfs:
    systemd.services.autofs.path = [ sshfsWrapper ];

    # Simple script to create necessary directories:
    systemd.services.autofsssh-prep = {
      description = "Prepare user directories for ssh mounting.";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.service" ];
      serviceConfig.Type = "oneshot";
      serviceConfig.ExecStart = "${prepScript}";
    };
  };
}

