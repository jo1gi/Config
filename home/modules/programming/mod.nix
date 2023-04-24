{ config, pkgs, lib, ... }:

{
  imports = [
    ./android.nix
    ./java.nix
    ./kotlin.nix
    ./python.nix
    ./rust.nix
    ./haxe.nix
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
        haxe.enable = true;
        java.enable = true;
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
    android.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    haxe.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    java.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    kotlin.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    python.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    rust.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

}