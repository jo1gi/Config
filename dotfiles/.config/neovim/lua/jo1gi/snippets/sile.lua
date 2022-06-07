-- Sile snippets
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
local simple = ls.parser.parse_snippet

return {
    simple({trig="begin"}, "\\begin{$1}\n\t$0\n\\end{$1}"),
    simple({trig="eq"}, "\\begin[mode=display]{math}\n\t$0\n\\end{math}"),

-- }}}
}
