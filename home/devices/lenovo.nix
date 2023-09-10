{ config, ... }:

{
  imports = [
    ../home.nix
    ../modules/temporary/compilers.nix
    ../modules/temporary/dissy.nix
  ];

  config.jo1gi = {
    terminal.fontsize = 11;
    general.enable = true;
  };

  config.wayland.windowManager.sway.enable = true;
}
