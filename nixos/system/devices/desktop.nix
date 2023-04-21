{ config, lib, ... }:

{
  imports = [
    ../modules/desktops/i3.nix
    ../modules/groups/games.nix
    ../modules/groups/pc.nix
    ../modules/hardware/graphics/nvidia.nix
    ../modules/services/distrobox.nix
    ../modules/services/yggdrasil.nix
  ];

  # Kernel
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];

  fileSystems."/home/jo1gi/Storage" = {
    device = "/dev/disk/by-uuid/1561e449-f074-43c0-b931-923b1ee44831";
    fsType = "ext4";
  };

  # CPU
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Misc
  networking.hostName = "desktop";
}
