{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ../standard.nix
  ];

  # Kernel
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sr_mod" "msr" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "msr" ];
  boot.extraModulePackages = [ ];

  # Partitions
  fileSystems."/" = { device = "/dev/disk/by-uuid/8ed65c6f-a276-46a0-8717-fe83b3ab94da";
      fsType = "ext4";
  };

  fileSystems."/boot" = { device = "/dev/disk/by-uuid/4155-D299";
      fsType = "vfat";
  };

	fileSystems."/home" = {
		device = "/dev/disk/by-uuid/46e9b15b-7bd2-4d51-a138-ab597fa891fe";
		fsType = "ext4";
	};

  swapDevices =[{
    device = "/dev/disk/by-uuid/51d80614-ae28-4d9c-bf38-f65c87bc8309"; }
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Misc
  networking.hostName = "desktop";
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.deviceSection = ''Option "TearFree" "true"'';
  services.syncthing.enable = true;
  personal = {
    desktop = "awesome";
    games.enable = true;
    general.enable = true;
    work.enable = true;
    vm.enable = true;
  };
}
