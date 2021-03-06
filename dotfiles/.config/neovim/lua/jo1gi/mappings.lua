local function map(mode, keys, cmd)
	local options = {noremap = true}
	vim.api.nvim_set_keymap(mode, keys, cmd, options)
end

local function nmap(keys, cmd)
	map("n", keys, cmd)
end

local function imap(keys, cmd)
    map("i", keys, cmd)
end

vim.g.mapleader = "å"

-- Saving file
nmap("<C-s>", "<cmd>w<CR>")
imap("<C-s>", "<cmd>w<CR>")

-- Configs
nmap("<leader>cf", "<cmd>execute \"edit /home/jo1gi/Projects/nixos/home/configs/neovim/old/ftplugin/\" . &filetype . \".vim\"<CR>")
nmap("<leader>cy", "<cmd>UltiSnipsEdit<CR>")

-- Telescope
nmap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")

-- Terminal
map('t', "<Esc>", '<C-\\><C-n>')

-- Which-key
local wk = require("which-key")
wk.setup{}
wk.register({
    ["åa"] = {
        name = "",
        a = { "gg=G<C-o>", "Autoindent file" },
        h = { "<cmd>nohls<CR>", "Remove search highlight" },
    },
    ["åc"] = {
        name = "Configs",
    },
    ["ål"] = {
        name = "LSP",
        d = { "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", "Diagnostics window" },
        g = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
        h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover documentation" },
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
        t = { "<cmd>TroubleToggle<CR>", "Toggle Trouble window" },
    },
    ["ås"] = {
        name = "Spelling",
        t = { "<cmd>set spell<CR>", "Toggle" },
        d = { "<cmd>set spelllang=da<CR>", "Danish" },
        e = { "<cmd>set spelllang=en<CR>", "English" },
        m = { "<cmd>set spelllang=da,en<CR>", "Multilang" },
    },
    ["åt"] = {
        name = "Telescope",
        a = { "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", "Code actions" },
        g = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Git commits" },
    }
})
