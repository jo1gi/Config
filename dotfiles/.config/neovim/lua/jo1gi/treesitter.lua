require('nvim-treesitter.configs').setup {
    ensure_installed = {"python", "rust", "java", "haskell", "clojure"},
    highlight = {
        enable = true,
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
