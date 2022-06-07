-- Neorg options
require("neorg").setup {
    load = {
        ["core.defaults"] = {}, -- Default setup
        ["core.norg.concealer"] = {}, -- Icons
    },
    hook = function()
        local neorg_leader = "<Leader>" -- You may also want to set this to <Leader>o for "organization"
        local neorg_callbacks = require('neorg.callbacks')
        neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
            keybinds.map_event_to_mode("norg", {
                n = {
                    { "gtd", "core.norg.qol.todo_items.todo.task_done" },
                    { "gtu", "core.norg.qol.todo_items.todo.task_undone" },
                    { "gtp", "core.norg.qol.todo_items.todo.task_pending" },
                    { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" }
                },
            }, { silent = true, noremap = true })
        end)
    end
}

-- Setup treesitter from Neorg
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}
