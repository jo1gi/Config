{ config, lib, pkgs, ... }:

let
  cfg = config.jo1gi.programming.teal;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      luajit
      luajitPackages.tl
      luajitPackages.teal-language-server
    ];

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("teal_ls")
      '';
    };
  };

  options.jo1gi.programming.teal = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
