{ config, lib, pkgs, ... }:

let
  cfg = config.jo1gi.programming.lua;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      luajit
      luajitPackages.lua-lsp
    ];

    programs.neovim = {
      extraLuaConfig = ''
        local nvim_lsp = require("lspconfig")

        -- Cmp setup
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        nvim_lsp.lua_ls.setup({
          cmd = {"lua-lsp"},
          capabilities = capabilities,
        })
      '';
    };
  };

  options.jo1gi.programming.lua = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
