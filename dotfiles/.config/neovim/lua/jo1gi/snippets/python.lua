-- Python snippets
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
    simple({trig="ifmain"}, "if __name__ == \"__main__\":\n\t$0"),
}
