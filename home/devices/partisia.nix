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

    programs.zsh = {
      initExtra = builtins.readFile ../../scripts/partisia-projects.zsh;
    };

    home.shellAliases = {
      "p" = "projects";
    };

    wayland.windowManager.sway.enable = true;

  };

}
