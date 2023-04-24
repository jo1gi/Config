{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.rust.enable {

    home.packages = with pkgs; [
      clippy
      rust-analyzer
      cargo
      rustc
    ];

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("rust_analyzer")
      '';
    };

  };
}
