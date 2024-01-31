{ config, lib, ...}:

{
  imports = [
    ../modules/groups/server.nix
    ../modules/services/syncthing.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e7213578-5412-4a1b-bc8a-64ad7e4f579b";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/B03D-FCAB";
    fsType = "vfat";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/88f8c071-86b4-4d80-8a02-3a0b11d20c92"; }
  ];

  time.timeZone = "Europe/Copenhagen";

  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;
  networking.hostName = "vision";
}
