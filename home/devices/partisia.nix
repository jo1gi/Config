{ config, pkgs, ... }:

{
  imports = [
    ../home.nix
    ../modules/temporary/partisia.nix
  ];

  config = {
    jo1gi = {
      terminal.fontsize = 13;
      general.enable = true;
    };

    programs = {
      glab.enable = true;
      findProject = {
        dir = "$HOME/src/secata";
      };
    };

    wayland.windowManager.sway.enable = true;

  };

}
