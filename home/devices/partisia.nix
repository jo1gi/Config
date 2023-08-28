{ config, ... }:

{
  imports = [
    ../home.nix
  ];

  config.jo1gi = {
    terminal.fontsize = 13;
    general.enable = true;
    partisia.enable = true;
    windowmanager.enable = true;
  };

  config.wayland.windowManager.sway.enable = true;
}
