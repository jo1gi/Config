{ config, pkgs, lib, ... }:

let
  cfg = config.jo1gi.programming.ocaml;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      cfg.package
      ocamlPackages.ocaml-lsp
      dune_3
      opam
    ];
    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')('ocamllsp')
      '';
      plugins = with pkgs.vimPlugins; [
        vim-ocaml
      ];
    };
  };

  options.jo1gi.programming.ocaml = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.ocaml;
    };
  };
}
