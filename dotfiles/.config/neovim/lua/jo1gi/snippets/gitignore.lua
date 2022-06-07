-- LaTeX snippets
local ls = require"luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local isn = ls.indent_snippet_node
local sn = ls.snippet_node
local l = require("luasnip.extras").lambda

return {
    s("latex", t({
        "# Latex files",
        "*.pdf",
        "*.aux",
        "*.toc",
        "*.out",
        "*.log",
        "*-blx.bib",
        "*.run.xml",
        "*.dvi",
        "*.bcf",
        "*.blg",
        "*.bbl",
        "*.synctex.gz"
    }))
}
