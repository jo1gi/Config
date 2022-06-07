{ config, lib, ... }:

{
	options.personal.laptop = lib.mkOption {
		type = lib.types.bool;
		default = false;
	};

	config = lib.mkIf config.personal.laptop {
		# Powersave mode
    powerManagement = {
      cpuFreqGovernor = lib.mkDefault "powersave";
      powertop.enable = true;
    };
		# Enable touchpad
    services.xserver.libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = false;
        middleEmulation = true;
        tapping = true;
      };
    };
		# Backlight
		programs.light.enable = true;
	};
}
