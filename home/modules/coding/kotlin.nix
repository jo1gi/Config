{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.kotlin.enable {

    home.packages = with pkgs; [
      kotlin
      kotlin-language-server
    ];

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("kotlin_language_server")
      '';
      plugins = with pkgs.vimPlugins; [
        kotlin-vim
      ];
    };
  };

  options.jo1gi.programming.kotlin = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
