-- Completion using nvim-cmp (https://github.com/hrsh7th/nvim-cmp/)
local lspkind = require("lspkind")
local cmp = require('cmp')

cmp.setup {
    enabled = true,
    sources = {
        { name = "nvim_lsp" },
        { name = "snippy" },
        { name = "path" },
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
    },
    formatting = {
        -- Add icon to item
        format = function(entry, vim_item)
            local icon = lspkind.presets.default[vim_item.kind]
            vim_item.kind = string.format("%s %s", vim_item.kind, icon)
            return vim_item
        end,
    },
    snippet = {
        expand = function(args)
            require 'snippy'.expand_snippet(args.body)
        end
    },
}
