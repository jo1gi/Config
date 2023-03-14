{ config, pkgs, lib, ... }:

{
  config = with pkgs; lib.mkIf config.jo1gi.programming.enable {
    jo1gi = {
      scripting.enable = true;
      terminal.enable = true;
    };

    home.packages = [
      # General
      stdenv
      gcc
      gnumake
      pkg-config
      openssl
      # Java
      clojure
      clojure-lsp
      jdt-language-server
      # java-language-server
      metals
      # Rust
      rust-analyzer
      cargo
      rustc
      # Andet
      scry
      nimlsp
      nim
      chicken
    ];
    programs.zsh.sessionVariables = {
      ANDROID_JAVA_HOME = pkgs.jdk.home;
      ANDROID_HOME = "$HOME/.android";
    };
    programs = {
      emacs.enable = false;
      neovim.enable = true;
      vscode.enable = false;
    };
  };

  options.jo1gi.programming = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
}
