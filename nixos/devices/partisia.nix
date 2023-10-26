{ ... }:

{
  imports =[
    ../modules/groups/pc.nix
    ../modules/desktops/sway.nix
    ../modules/hardware/graphics/amd.nix
    ../modules/hardware/laptop.nix
  ];

  virtualisation.docker.enable = true;

  powerManagement = {
    cpuFreqGovernor = "performance";
    powertop.enable = false;
  };

  # Misc
  networking = {
    hostName = "partisia";
    hosts = {
      "127.0.0.1" = [ "docker" ];
    };
  };
}
