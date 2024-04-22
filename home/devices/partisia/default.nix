{ config, pkgs, ... }:

{
  imports = [
    ../../home.nix
  ];

  config = {

    jo1gi = {
      terminal.fontsize = 13;
      general.enable = true;
      programming = {
        haxe.enable = true;
        java = {
          enable = true;
          jdk = pkgs.jdk17;
          maven = {
            enable = true;
            options = [
              "-Dmaven.gitcommitid.skip=true"
            ];
          };
        };
        nodejs.enable = true;
        rust = {
          enable = true;
          useRustup = true;
        };
      };
    };

    programs = {
      qutebrowser.enable = true;
      glab.enable = true;
      findProject = {
        dir = "$HOME/Projects";
        # dir = "$HOME/src/secata";
      };
      direnv = {
        enable = true;
      };
    };

    # xsession.windowManager.i3.enable = true;
    wayland.windowManager.sway.enable = true;

    home.packages = with pkgs; [
      # jetbrains.idea-community
      jetbrains.idea-ultimate
      watchman
    ];

    home.sessionPath = [
      "$HOME/bin"
    ];

    home.sessionVariables = {
      GITLAB_PRIVATE_TOKEN = builtins.readFile ./gitlab_private_token;
    };

  };

}
