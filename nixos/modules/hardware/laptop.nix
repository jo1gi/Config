{ config, lib, ... }:

{
	config = {
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
    # Bluetooth
    hardware.bluetooth.enable = true;
	};
}
