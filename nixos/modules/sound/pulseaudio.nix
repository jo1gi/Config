{ config, pkgs, lib, ... }:

{
	config = lib.mkIf (config.personal.soundsystem == "pulseaudio") {
		sound.enable = true;
		hardware.pulseaudio = {
			enable = true;
			support32Bit = true;
			package = pkgs.pulseaudioFull;
		};
	};
}
