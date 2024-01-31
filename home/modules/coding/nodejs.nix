{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.nodejs.enable {

    home.packages = with pkgs; [
      nodejs
      typescript
      nodePackages.typescript-language-server
    ];

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("tsserver")
      '';
    };

  };

  options.jo1gi.programming.nodejs = {

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

  };
}
