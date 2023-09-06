{ pkgs, ... }:

{
	system.stateVersion = "21.05";

	# Timezone
	time.timeZone = "Europe/Copenhagen";

	# Select internationalisation properties
	console = {
		font = "Lat2-Terminus16";
		keyMap = "dk";
	};
	services.xserver.layout = "dk";
	i18n.defaultLocale = "en_DK.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "da_DK.UTF-8";
		LC_IDENTIFICATION = "da_DK.UTF-8";
		LC_MEASUREMENT = "da_DK.UTF-8";
		LC_MONETARY = "da_DK.UTF-8";
		LC_NAME = "da_DK.UTF-8";
		LC_NUMERIC = "da_DK.UTF-8";
		LC_PAPER = "da_DK.UTF-8";
		LC_TELEPHONE = "da_DK.UTF-8";
		LC_TIME = "da_DK.UTF-8";
	};

	# Networking
	networking = {
		firewall.enable = false;
		useDHCP = false;
		networkmanager = {
			enable = true;
			wifi = {
				powersave = false;
			};
		};
	};

# User
	users.users.jo1gi = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
		shell = pkgs.zsh;
	};
  programs.zsh.enable = true;

# Fonts
	fonts.fonts = with pkgs; [
		nerdfonts
			libertinus
			gentium
	];

# Udisk
	services.udisks2.enable = true;

# Mail certificate
	security.pki.certificateFiles = [
		../../../assets/mailserver.crt
	];

# Globally available packages
	environment.systemPackages = with pkgs; [
		wget git alacritty neovim btrfs-progs
	];

# Kernel parameters
	boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
	boot.supportedFilesystems = [ "ntfs" ];

# Firmware
	hardware = {
		enableRedistributableFirmware = true;
		enableAllFirmware = true;
	};

	imports = [
		../hardware/standard-filesystems.nix
			../programs/adb.nix
			../programs/doas.nix
			../programs/nix.nix
			../services/sound/pipewire.nix
			../services/syncthing.nix
			../services/systemd-boot.nix
			../services/virtualisation/docker.nix
			../services/virtualisation/qemu.nix
	];

}
