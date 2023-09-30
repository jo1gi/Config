{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.haxe.enable {

    home.packages = with pkgs; [
      haxe
      nodejs
    ];

    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        (pkgs.vimUtils.buildVimPlugin {
          pname = "haxe.vim";
          version = "1";
          src = pkgs.fetchFromGitHub {
            owner = "kLabz";
            repo = "haxe.vim";
            rev = "5fe5ff115675ad46334b65406a386a48a8f2238e";
            sha256 = "sha256-4qfkd4Kbq6qz6x98fD3RdUQuo28wsZmbgJkHWh2epOY=";
          };
        })
      ];
      extraLuaConfig = ''
        local nvim_lsp = require("lspconfig")

        -- Cmp setup
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        nvim_lsp.haxe_language_server.setup({
          cmd = {"node", "/home/jo1gi/Downloads/Repos/haxe-language-server/bin/server.js"},
          capabilities = capabilities,
        })
      '';
    };

  };

  options.jo1gi.programming.haxe = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
