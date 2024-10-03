{ ... }:

{
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.deviceSection = ''Option "TearFree" "true"'';
  hardware = {
    nvidia.open = true;
    graphics.enable = true;
  };
}
