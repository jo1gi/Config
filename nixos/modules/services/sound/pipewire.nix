{ config, pkgs, lib, ...}:

{
	config = {
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
