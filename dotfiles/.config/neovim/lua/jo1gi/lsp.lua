local nvim_lsp = require('lspconfig')

-- Cmp Setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Language setup
servers = { "clojure_lsp", "gopls", "nimls", "pyright", "rust_analyzer", "metals" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
    }
end
-- Java setup
nvim_lsp.java_language_server.setup{
    cmd = {"java-language-server"},
    capabilities = capabilities,
}

-- Improvements
local saga = require 'lspsaga'
saga.init_lsp_saga()

-- Custom icons
require('lspkind').init({
    mode = "text_symbol",
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Field = '',
      Constant = '',
      Struct = ''
    },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
})
