{ config, pkgs, lib, ... }:

{
  imports = [
    ./android.nix
    ./go.nix
    ./haxe.nix
    ./java.nix
    ./kotlin.nix
    ./nim.nix
    ./nodejs.nix
    ./ocaml.nix
    ./python.nix
    ./rust.nix
  ];

  config = lib.mkIf config.jo1gi.programming.enable {

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
