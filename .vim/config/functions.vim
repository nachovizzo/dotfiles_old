"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! EnableCoc()
    exec "CocEnable"
    set signcolumn=yes
    source ~/.vim/config/coc_default.vim
endfunction

function! DisableCoc()
    exec "CocDisable"
    set signcolumn=no
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Inster Python debugger inline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertIpdbLine()
  let trace = expand("import ipdb; ipdb.set_trace()")
  execute "normal o".trace
endfunction
