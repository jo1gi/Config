{ config, pkgs, lib, ...}:

{
	config = {
		# Can cause problems if enabled
		sound.enable = false;
		# rtkit is optional but recommended
		security.rtkit.enable = true;
		services.pipewire = {
			enable = true;
			alsa = {
				enable = true;
				support32Bit = true;
			};
			pulse.enable = true;
		};
	};
}
