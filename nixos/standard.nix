{ config, pkgs, ... }:

{
  system.stateVersion = "21.05";

	# Timezone
	time.timeZone = "Europe/Copenhagen";

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

	# Select internationalisation properties.
	i18n.defaultLocale = "en_DK.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		keyMap = "dk";
	};
  services.xserver.layout = "dk";

	# System packages
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		wget git
	];

	# Doas
  security = {
    doas = {
      enable = true;
      extraRules = [
        { groups = [ "wheel" ]; keepEnv = true; cmd = "nvim"; }
      ];
    };
  };

	# User
	users.users.jo1gi = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
		shell = pkgs.zsh;
	};

	# Collects garbage automaticly
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 14d";
	};

  # Fonts
	fonts.fonts = with pkgs; [
		nerdfonts
    libertinus
    gentium
	];

  security.pki.certificateFiles = [
    home-manager/assets/mailserver.crt
  ];

	imports = [
		./home-manager/additional_programs.nix
    ./homemanager.nix

    ./modules/desktops.nix
    ./modules/games.nix
    ./modules/general.nix
    ./modules/laptop.nix
    ./modules/lightdm.nix
    ./modules/picom.nix
    ./modules/sound.nix
    ./modules/syncthing.nix
    ./modules/vm.nix
    ./modules/work.nix
	];
}
