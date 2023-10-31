{ config, pkgs, ... }:

{
  imports = [
    ../../home.nix
    ../../modules/temporary/partisia.nix
  ];

  config = {
    jo1gi = {
      terminal.fontsize = 13;
      general.enable = true;
    };

    programs = {
      glab.enable = true;
      zsh = {
        initExtra = builtins.readFile ./partisia-projects.zsh;
      };
    };

    home.shellAliases = {
      "p" = "projects";
    };

    wayland.windowManager.sway.enable = true;

  };

}
