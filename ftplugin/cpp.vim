
setlocal commentstring=//\ %s

"# clang-format

let b:formatter_path = '/usr/share/vim/addons/syntax/clang-format.py'

" Format line or selection
execute 'noremap <buffer> <LocalLeader>f :<C-U>py3f ' . b:formatter_path . '<CR>'

" Format the entier buffer
execute 'noremap <buffer> <LocalLeader>F :<C-U>%py3f ' . b:formatter_path . '<CR>'

" Pre-write formatting hook
function! FormatOnSave()
    let l:formatdiff = 1
    execute 'py3f ' . b:formatter_path
endfunction

" Auto-format before write write
" autocmd BufWritePre <buffer> call FormatOnSave()
