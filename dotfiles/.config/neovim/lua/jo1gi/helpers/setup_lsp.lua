local nvim_lsp = require("lspconfig")

-- Cmp setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

function setup_lsp(server_name)
    nvim_lsp[server_name].setup {
        capabilities = capabilities,
    }
end

return setup_lsp
