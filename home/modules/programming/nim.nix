{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.nim.enable {

    home.packages = with pkgs; [
      nim
      nimlsp
    ];

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("nimls")
      '';
      plugins = with pkgs.vimPlugins; [
        nim-vim
      ];
    };

  };

  options.jo1gi.programming.nim = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
