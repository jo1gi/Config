-- Completion using nvim-cmp (https://github.com/hrsh7th/nvim-cmp/)
local lspkind = require("lspkind")
local cmp = require('cmp')

cmp.setup {
    enabled = true,
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    formatting = {
        -- Add icon to item
        format = function(entry, vim_item)
            local icon = lspkind.presets.default[vim_item.kind]
            vim_item.kind = string.format("%s %s", vim_item.kind, icon)
            return vim_item
        end,
    },
}
