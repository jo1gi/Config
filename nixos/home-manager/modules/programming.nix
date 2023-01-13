{ config, pkgs, lib, ... }:

{
  config = with pkgs; lib.mkIf config.personal.programming.enable {
    personal = {
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
      godotMono
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

  options.personal.programming = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
}
