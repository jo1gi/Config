{ config, pkgs, ... }:

{
  imports = [
    ../home.nix
  ];

  config = {
    jo1gi = {
      terminal.fontsize = 13;
      general.enable = true;
      programming = {
        java = {
          enable = true;
          enableMaven = true;
          jdk = pkgs.jdk17;
        };
        nodejs.enable = true;
        rust = {
          enable = true;
          useRustup = true;
        };
      };
    };

    programs = {
      glab.enable = true;
      findProject = {
        dir = "$HOME/src/secata";
      };
    };

    wayland.windowManager.sway.enable = true;

    home.packages = with pkgs; [
      jetbrains.idea-community
      # jetbrains.idea-ultimate
      watchman
    ];

  };

}
