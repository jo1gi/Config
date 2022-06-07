-- Java snippets
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

local function get_classname()
    local path = vim.api.nvim_buf_get_name(0)
    local filename = string.match(path, "[^/]+$")
    return string.gsub(filename, ".java", "")
end

local function function_snippet(trig, name, header)
    return s({trig=trig,name=name}, {
        t(header .. " "), i(1), t("("), i(2), t({") {", "\t"}), i(0), t({"", "}"})
    })
end


return {
    s("class", {
        t("public class "),
        f(function(_, _) return get_classname() end, {}),
        t({" {", "\t"}), i(0), t({"", "}"}),
    }),
    simple({name="Main method", trig="main"},
        "public static void main(String[] args){\n\t$0\n}"),
    s("/**", {
        t({"/**", "* "}), i(1),
        t({"", "* @return "}), i(2),
        t({"", "*/"})
    }),
    simple({trig="range"}, "for($1=0; $1<$2; $1++){\n\t$0\n}"),
    simple({trig="print"}, "System.out.println($1);$0"),
    function_snippet("psv", "Public void procedure", "public static void"),
    function_snippet("pv", "Public void method", "public void"),
    function_snippet("psi", "Public int method", "public static int"),
    function_snippet("pi", "Public int procedure", "public int"),
    function_snippet("psS", "Public String procedure", "public static String"),
    function_snippet("pS", "Public String method", "public String"),
    function_snippet("ps", "Public procedure", "public static"),
}
