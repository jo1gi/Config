{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")

    ../modules/groups/server.nix
    ../modules/services/mail.nix
  ];

  system.stateVersion = "21.11";

  # Filesystem
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/e937b378-04d5-4c1a-b2fd-5562e10a4987";
      fsType = "btrfs";
    };
  };
  swapDevices = [
    { device = "/dev/disk/by-uuid/deded43d-0ea0-4988-a6a0-664010ab8cdb"; }
  ];

  # Boot
  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/vda";

  # Timezone
  time.timeZone = "America/New_York";

  # Networking
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.hostName = "mailserver";
}
