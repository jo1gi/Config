-- Tex snippets
-- vim: foldmethod=marker
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
    s({trig="img", name="Graphics"}, {
        t("\\includegraphics[width=0."), i(1,"8"), t("\\textwidth]"),
        t("{"), i(2), t("}"),
        i(0),
    }),
    s({trig="eq", name="Equation"}, {
        t({"\\begin{equation*}", "\t\\begin{aligned}", "\t\t"}),
        i(0),
        t({"","\t\\end{aligned}", "\\end{equation*}"})
    }),
    s({trig="pmatrix"}, {
        t("\\begin{pmatrix} "), i(0), t(" \\end{pmatrix}")
    }),
    simple({trig="use"}, "\\usepackage$2{$1}"),
    simple({trig="begin"}, "\\begin{$1}\n\t$0\n\\end{$1}"),
    -- Document templates {{{
    simple({trig="mattemplate"},[[
% vim: spelllang=da
\\documentclass[a4paper, 12pt]{article}

\\usepackage[utf8]{inputenc}
\\usepackage{graphicx}
\\usepackage{tgtermes}
\\usepackage{fouriernc}
\\usepackage[danish]{babel}
\\usepackage[T1]{fontenc}
\\usepackage[margin=3cm]{geometry}

\\usepackage{amssymb}
\\usepackage{amsmath}

\\usepackage{enumerate}
\\usepackage{verbatim}

\\newcommand{\\N}{\\mathbb{N}}
\\newcommand{\\Z}{\\mathbb{Z}}
\\newcommand{\\Q}{\\mathbb{Q}}
\\newcommand{\\R}{\\mathbb{R}}

\\title{$1}
\\author{${2:Joakim Holm, studienummer: 202107428}}

\\begin{document}
\\maketitle

$0
\\end{document}]]
    ),
    simple({trig="dattemplate"}, [[\documentclass[a4paper, 12pt]{article}

\usepackage{geometry}
\usepackage{graphicx}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage[ruled,vlined]{algorithm2e}
\usepackage{float}

\title{$1}
\author{${2:Joakim Holm og Victor Ask Justesen}}
\date{$3}

\begin{document}
\maketitle

$0
\end{document}
]])
-- }}}
}
