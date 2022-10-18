{ config, lib, pkgs, modulesPath, ... }:

{
  imports =[
    ../standard.nix
  ];

  # Kernel
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # Filesystem
  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hardware
  hardware = {
    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    # Video
    opengl = {
      enable = true;
      driSupport32Bit = config.hardware.opengl.enable;
      extraPackages = with pkgs; [
        amdvlk
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
    # Bluetooth
    bluetooth.enable = true;
  };
  services.xserver ={
    videoDrivers = [ "amdgpu" ];
    deviceSection = ''Option "TearFree" "true"'';
  };

  # Misc
  networking.hostName = "lenovo";
  services.syncthing.enable = true;
  personal = {
    desktop = "sway";
    laptop = true;
    games.enable = true;
    general.enable = true;
    school.enable = true;
    work.enable = true;
  };
  home-manager.users.jo1gi.config.personal = {
    terminal = {
      fontsize = 13;
    };
  };

}
