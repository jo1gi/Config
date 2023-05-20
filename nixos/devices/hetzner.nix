{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ../modules/groups/server.nix
    # ../modules/services/transmission.nix
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
  system.stateVersion = "21.11";
}
