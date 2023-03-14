{ ... }:

{
  imports = [
    ../modules/desktops/i3.nix
    ../modules/groups/games.nix
    ../modules/groups/pc.nix
    ../modules/hardware/graphics/nvidia.nix
  ];

  # Kernel
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sr_mod" "msr" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "msr" ];
  boot.extraModulePackages = [ ];

	fileSystems."/home" = {
		device = "/dev/disk/by-uuid/46e9b15b-7bd2-4d51-a138-ab597fa891fe";
		fsType = "ext4";
	};

  # Misc
  networking.hostName = "desktop";
}
