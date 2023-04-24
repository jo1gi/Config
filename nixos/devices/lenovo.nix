{ ... }:

{
  imports =[
    ../modules/groups/pc.nix
    ../modules/groups/games.nix
    ../modules/desktops/sway.nix
    ../modules/hardware/graphics/amd.nix
    ../modules/hardware/laptop.nix
  ];

  # Misc
  networking.hostName = "lenovo";

}
