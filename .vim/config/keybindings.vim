
" leader keybindings
nmap <leader>w :w<cr>
nmap <C-s> :w<cr>
nmap <leader>q :q!<cr>

imap jk <ESC>
imap kj <ESC>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Visual Block replaced by paste comand
nnoremap <C-b> <c-v>

" Copy paste like almost real humans
map <C-c> "+y
map <C-V> "+p

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>



" Automatically format files after writing the buffer, removing whitespaces
" and end of line(if any)
nmap <leader>f :Autoformat<cr> | %s/\s\+$//e | %s/\n\+\%$//e
