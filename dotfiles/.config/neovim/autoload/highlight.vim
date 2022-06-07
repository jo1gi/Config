function highlight#update()
    " Remove background from line number
    call Base16hi("LineNr", "", g:base16_gui00, "", g:base16_cterm00)
    " Colourcolumn
    call Base16hi("ColorColumn", "", g:base16_gui02, "", "")
    call Base16hi("Conceal", g:base16_gui03, "", "", "")
    " Gutter
    call Base16hi("SignColumn", "", g:base16_gui00, "", g:base16_cterm00)
    call Base16hi("GitGutterAdd", "", g:base16_gui00, "", "")
    call Base16hi("GitGutterDelete", "", g:base16_gui00, "", "")
    call Base16hi("GitGutterChange", "", g:base16_gui00, "", "")
    " Tabline
    call Base16hi("TabLineFill", "", g:base16_gui00, "", "")
    call Base16hi("TabLineSel", g:base16_gui0A, g:base16_gui00, "", "")
    call Base16hi("TabLine", g:base16_gui03, g:base16_gui00, "", "")
    " LuaTree Icons
    call Base16hi("LuaTreePythonIcon", g:base16_gui06, "", "", "")
    call Base16hi("LuaTreeRustIcon", g:base16_gui06, "", "", "")
    " Coqtail
    call Base16hi("CoqtailChecked",  "", g:base16_gui02, "", g:base16_cterm02)
    call Base16hi("CoqtailSent",  "", g:base16_gui02, "", g:base16_cterm02)
endfunction
