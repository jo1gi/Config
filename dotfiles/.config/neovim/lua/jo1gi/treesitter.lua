require('nvim-treesitter.configs').setup {
    parser_install_dir = "~/.local/share/nvim/tree-sitter/",
    -- Plugins
    highlight = {
        enable = true,
        disable = {"nix","tex","latex","scala", "bash"},
        additional_vim_regex_highlighting = { "markdown" },
    },
    indent = {
        enable = true
    },
    rainbow = {
        enable = false,
        disable = {'bash','rust','python','java'}
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
}
