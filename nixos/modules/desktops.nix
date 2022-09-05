{ config, lib, ... }:

{
  imports = [
    ./desktops/awesomewm.nix
    ./desktops/i3.nix
    ./desktops/plasma.nix
    ./desktops/sway.nix
  ];

  options.personal.desktop = lib.mkOption {
    type = lib.types.enum [
      "none"
      "awesome"
      "i3"
      "gnome"
      "plasma"
      "sway"
    ];
    default = "none";
  };
}
