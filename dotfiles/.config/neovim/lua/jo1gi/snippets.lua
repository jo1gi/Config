-- Luasnippet configuration
-- vim: foldmethod=marker
local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

ls.config.set_config({
    enable_autosnippets = true,
})

ls.snippets = {
    -- all {{{
    all = {
        -- Random info
        s({name="Studienummer",trig="studienr"}, t("202107428")),
        s({name="Victor's fulde navn",trig="vicname"}, t("Victor Ask Justesen")),
        s({name="Victor's studienummer",trig="vicnr"}, t("202107105")),
        s({name="Victor's navn og studienummer",trig="vicfull"},
            t("Victor Ask Justesen 202107105"))
    },
    -- }}}
    gitignore = require("jo1gi.snippets.gitignore"),
    java = require("jo1gi.snippets.java"),
    nix = require("jo1gi.snippets.nix"),
    python = require("jo1gi.snippets.python"),
    sile = require("jo1gi.snippets.sile"),
    tex = require("jo1gi.snippets.tex"),
}
ls.autosnippets = {
    tex = {
        s({regTrig=true, trig="^# "}, {t("\\section{"), i(1), t("}")}),
        s({regTrig=true, trig="^## "}, {t("\\subsection{"), i(1), t("}")}),
        s({regTrig=true, trig="^### "}, {t("\\subsubsection{"), i(1), t("}")}),
        s({regTrig=true, trig="^#### "}, {t("\\subsubsubsection{"), i(1), t("}")}),
    }
}

-- Luasnip mappings {{{
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if ls and ls.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    end
    return ""
end
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- }}}
