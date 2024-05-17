{ config, pkgs, lib, ... }:

{
  imports = [
    ./android.nix
    ./gerbil.nix
    ./go.nix
    ./haxe.nix
    ./hy.nix
    ./java.nix
    ./kotlin.nix
    ./lua.nix
    ./nim.nix
    ./nix.nix
    ./nodejs.nix
    ./ocaml.nix
    ./python.nix
    ./racket.nix
    ./rust.nix
    ./teal.nix
  ];

  config = lib.mkIf config.jo1gi.programming.enable {

    home.file = {
      "${config.home.homeDirectory}/.local/bin/rerun-pipeline" = {
        source = ./scripts/rerun-pipeline.sh;
        executable = true;
      };
    };

    home.packages = with pkgs; [
      stdenv
      gcc
      gnumake
      pkg-config
      openssl
    ];

    programs = {
      git.enable = true;
      emacs.enable = false;
      neovim.enable = true;
      vscode.enable = false;
    };

    jo1gi = {
      terminal.enable = true;
      programming = {
        python.enable = true;
        rust.enable = true;
      };
    };

  };

  options.jo1gi.programming = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

}
