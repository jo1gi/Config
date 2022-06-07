{ config, lib, ... }:

{
  imports = [
    ./desktops/awesomewm.nix
    ./desktops/plasma.nix
    ./desktops/sway.nix
  ];

  options.personal.desktop = lib.mkOption {
    type = lib.types.enum [
      "none"
      "awesome"
      "plasma"
      "gnome"
      "sway"
    ];
    default = "none";
  };
}
