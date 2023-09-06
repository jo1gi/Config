{ config, lib, pkgs, ... }:

let
  cfg = config.jo1gi.programming.rust;
  normalPackages = with pkgs; [
    clippy
    rust-analyzer
    cargo
    rustc
  ];
  rustupPackages = with pkgs; [ rustup ];
in
{
  config = lib.mkIf cfg.enable {

    home.packages = if cfg.useRustup then rustupPackages else normalPackages;

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("rust_analyzer")
      '';
      treeSitterGrammars = [
        pkgs.vimPlugins.nvim-treesitter-parsers.rust
      ];
    };

  };

  options.jo1gi.programming.rust = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    useRustup = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
