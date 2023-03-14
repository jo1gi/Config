{ config, lib, ... }:

{
  imports = [
    ./i3.nix
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
