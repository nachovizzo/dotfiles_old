
" leader keybindings
nmap <leader>w :w<cr>
nmap <C-s> :w<cr>
nmap <leader>q :q!<cr>

imap jk <ESC>
imap kj <ESC>

""""""""""""""""""""""""""""""
" => Shortcutting split navigation, saving a keypress:
""""""""""""""""""""""""""""""
" Remap split navitations to just CTRL +hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Same but using the leader, you can't hold down this key, what a shame
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Split configurations
set splitbelow splitright
noremap <silent> <C-Left>  :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up>    :resize +3<CR>
noremap <silent> <C-Down>  :resize -3<CR>

" Visual Block replaced by paste comand
nnoremap <C-b> <c-v>

" Copy paste like almost real humans
map <C-c> "+y
map <C-V> "+p

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

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

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Automatically format files after writing the buffer, removing whitespaces
" and end of line(if any)
nmap <leader>f :Autoformat<cr> | %s/\s\+$//e | %s/\n\+\%$//e

""""""""""""""""""""""""""""""
" => NERDTree bindings
""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
