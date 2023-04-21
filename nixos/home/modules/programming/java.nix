{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.jo1gi.programming.java.enable {

    home.packages = with pkgs; [
      gradle
      jdk
      jdt-language-server
    ];

    programs.neovim.plugins = with pkgs.vimPlugins; [
      nvim-jdtls
    ];

  };
}
