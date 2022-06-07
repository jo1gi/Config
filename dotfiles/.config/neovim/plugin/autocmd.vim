if has('autocmd')
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && bufname() == 'LuaTree' |
                \ quit | endif
    " Update folds in markup files
    autocmd CursorHold *.tex,*.md,*.org set foldmethod=expr
    " Restore i-beam when closing neovim
    autocmd VimLeave * set guicursor=a:ver10
endif
