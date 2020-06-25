"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => The most relevant keybindigs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w<cr>
nmap <leader>q :q!<cr>
nmap <C-s> :w<cr>

" j+k or k+j escapes insert mode
imap jk <ESC>
imap kj <ESC>

" Copy paste: leader+c / leader+v
map <leader>c "+y
map <leader>p "+p

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcutting split navigation, saving a keypress:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap split navitations to just CTRL +hjkl
map <M-h> <C-w>h
map <M-j> <C-w>j
map <M-k> <C-w>k
map <M-l> <C-w>l

" Remap move windows with just CTRL+SHITT+hjkl
map <C-h> <C-w>H
map <C-j> <C-w>J
map <C-k> <C-w>K
map <C-l> <C-w>L

" Same but using the leader, you can't hold down this key, what a shame
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Split configurations
noremap <silent> <C-Left>  :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up>    :resize +3<CR>
noremap <silent> <C-Down>  :resize -3<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent><leader>r :call VisualSelection('replace', '')<CR>

" Automatically format files after writing the buffer, removing whitespaces
" and end of line(if any)
nmap <silent><leader>f :Autoformat<cr> | %s/\s\+$//e | %s/\n\+\%$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader>n :NERDTreeToggle<cr>
nnoremap <silent><Leader>m :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader>ce :call EnableCoc()<cr>
nnoremap <silent><leader>cd :call DisableCoc()<cr>
nnoremap <silent><leader>cr :CocRestart<cr>
