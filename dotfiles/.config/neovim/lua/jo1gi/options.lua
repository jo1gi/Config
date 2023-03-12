local opt = vim.opt
local g = vim.g

-- Misc
opt.hidden = true
opt.encoding = "utf-8"
opt.completeopt = "menuone,noselect"

-- Theming
opt.termguicolors = false

-- Lines
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.cursorline = true

-- Indent
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.autoindent = true

-- Listchars
opt.listchars = "tab:   ,trail:·"
opt.list = true

-- Word Wrap
opt.wrap = true
opt.linebreak = true

-- Conceal
opt.conceallevel = 0
opt.concealcursor = "n"

-- Folding
opt.foldmethod = "indent"
opt.foldlevel = 1

-- Searching
opt.smartcase = true

-- Spelling
opt.spell = false

-- Deoplete
g["deoplete#enable_at_startup"] = 1

-- Indentline
g["indentline_char"] = "¦"
g["indentline_ignored_filetypes"] = {"help", "man", "markdown", "rst", "org", "tex", "snippets", "css", "scss"}
g["indentline_ignored_buftypes"] = {"terminal"}
g["indentline_max_indent_level"] = 20

-- Blackline
g["indent_blankline_char"] = g["indentline_char"]
g["indent_blankline_filetype_exclude"] = g["indentline_ignored_filetypes"]
g["indent_blankline_buftype_exclude"] = g["indentline_ignored_buftypes"]

-- Ultisnips
g["UltiSnipsExpandTrigger"] = "<tab>"
g["UltiSnipsJumpForwardTrigger"] = "<tab>"
g["UltiSnipsJumpBackwardTrigger"] = "<c-z>"

-- Conjure
g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
g["conjure#client#scheme#stdio#command"] = "csi -quiet -:c"
g["conjure#client#scheme#stdio#prompt_pattern"] = "\n-#;%d-> "
g['conjure#extract#tree_sitter#enabled'] = true

-- Telescope
require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            "__pycache__/",
            "target",
        }
    },
}
