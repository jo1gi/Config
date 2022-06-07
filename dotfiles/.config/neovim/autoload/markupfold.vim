function markupfold#foldExpr(lang)
    return luaeval("require('markup-fold.main')('".a:lang."',".v:lnum.")")
endfunction

function markupfold#setup(lang)
    setlocal foldexpr=markupfold#foldExpr(a:lang)
    setlocal foldmethod=expr
    setlocal foldlevel=0
endfunction
