{ config, lib, pkgs, ... }:

let
  cfg = config.jo1gi.programming.nix;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.nil
    ];
    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("nil_ls")
      '';
    };
  };

  options.jo1gi.programming.nix = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
