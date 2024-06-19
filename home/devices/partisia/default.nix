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
      glab.enable = true;
      findProject = {
        dir = "$HOME/Projects";
      };
    };

    # xsession.windowManager.i3.enable = true;
    wayland.windowManager.sway.enable = true;

    home.packages = with pkgs; [
      # jetbrains.idea-community
      jetbrains.idea-ultimate
      watchman

      kubectl
      minikube
      pulumi-bin

      create-docker-image
      spotless
    ];

    home.sessionPath = [
      "$HOME/bin"
    ];

    home.sessionVariables = {
      GITLAB_PRIVATE_TOKEN = builtins.readFile ./gitlab_private_token;
      PULUMI_CONFIG_PASSPHRASE = "";
    };

    nixpkgs.overlays = [
      (self: super: {
        create-docker-image = pkgs.callPackage ./scripts/create-docker-image.nix {};
        spotless = pkgs.callPackage ./scripts/spotless.nix {};
      })
    ];

  };

}
