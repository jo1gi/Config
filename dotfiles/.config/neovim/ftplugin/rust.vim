if has('folding')
    setlocal foldmethod=expr
    setlocal foldexpr=nvim_treesitter#foldexpr()
endif
