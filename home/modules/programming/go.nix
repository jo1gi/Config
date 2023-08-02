{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.go.enable {

    home.packages = with pkgs; [
      go
      gopls
    ];

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("gopls")
      '';
    };

  };
}
