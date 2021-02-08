"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufWritePost ~/.vimrc,~/.vim/config/basic.vim,~/.vim/config/coc.vim,~/.vim/config/keybindings.vim,~/.vim/config/plugins_config.vim,~/.vim/config/extended.vim
            \ source ~/.vimrc | AirlineRefresh

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetypes syntax settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead .clang-* set syntax=yaml

" For C++ files use 2 instead of 4
au BufRead,BufEnter *.cpp,*.cc,*.h,*.hpp setlocal ts=2 sw=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoreaload buffer when something changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable automatic comment insertion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
