{ config, pkgs, lib, ... }:

let
  cfg = config.jo1gi.programming.racket;
in
{
  config = lib.mkIf cfg.enable  {

    home.packages = [
      pkgs.racket
    ];

    programs.neovim = {
      plugins = [
        pkgs.vimPlugins.vim-racket
      ];
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("racket_langserver")
      '';
    };

  };

  options.jo1gi.programming.racket = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

}
