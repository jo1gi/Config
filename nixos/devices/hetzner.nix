{ modulesPath, pkgs, lib, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ../modules/groups/server.nix
    ../modules/services/syncthing.nix
    ../modules/services/mail.nix
  ];

  # Boot
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
  };
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "xen_blkfront" ];
  boot.initrd.kernelModules = [ "nvme" ];

  # Filesystems
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/AC27-D9D6";
    fsType = "vfat";
  };
  system.fsPackages = [ pkgs.sshfs ];
  fileSystems."/mnt/storagebox" = {
    device = "u351753@u351753.your-storagebox.de:";
    fsType = "sshfs";
    options = [
      "rw"
      "nodev"
      "noatime"
      "allow_other"          # for non-root access
      "max_read=65536"
      # SSH options
      "Port=23"
      "IdentityFile=/var/secrets/storage-key"
    ];
  };

  # Networking
  networking = {
    nameservers = [ "8.8.8.8" ];
    defaultGateway = "172.31.1.1";
    defaultGateway6 = {
      address = "fe80::1";
      interface = "eth0";
    };
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="49.13.23.121"; prefixLength=32; }
        ];
        ipv6.addresses = [
          { address="2a01:4f8:c012:28bf::1"; prefixLength=64; }
          { address="fe80::9400:2ff:fe34:b1ce"; prefixLength=64; }
        ];
        ipv4.routes = [ { address = "172.31.1.1"; prefixLength = 32; } ];
        ipv6.routes = [ { address = "fe80::1"; prefixLength = 128; } ];
      };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="96:00:02:34:b1:ce", NAME="eth0"

  '';

  # Misc
  time.timeZone = "Europe/Berlin";
  boot.cleanTmpDir = true;
  zramSwap.enable = true;
  networking.hostName = "hetzner";
  networking.domain = "";
  system.stateVersion = "22.11";
  services.transmission = {
    enable = true;
    openPeerPorts = true;
    openRPCPort = true;
    settings = {
      incomplete-dir = "/mnt/storagebox/torrents/incomplete";
      download-dir = "/mnt/storagebox/torrents/download";
    };
    # home = "/home/jo1gi/transmission";
    # settings = let
    #   baseDir = "/mnt/storagebox/torrents";
    # in {
    #   incomplete-dir = "${baseDir}/incomplete";
    #   download-dir = "${baseDir}/download";
    # };
  };
}
