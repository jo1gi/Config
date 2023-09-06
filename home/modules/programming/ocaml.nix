{ config, pkgs, lib, ... }:

let
  cfg = config.jo1gi.programming.ocaml;
in
{
  config = lib.mkIf cfg.enable {
    home.pacakges = with pkgs; [
      ocaml
      ocamlPackages.lsp
    ];
    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')('ocamllsp')
      '';
    };
  };

  options.jo1gi.programming.ocaml = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
