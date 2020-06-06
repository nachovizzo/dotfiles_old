" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'zhou13/vim-easyescape'
Plug 'tpope/vim-fugitive'
Plug 'nachovizzo/committia.vim'


" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""
" => Easyescape config
""""""""""""""""""""""""""""""
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>


" My configs
set number
set relativenumber

" Fast quiting
nmap <leader>q :q!<cr>
nmap <leader>b :Gblame<cr>

colorscheme gruvbox
set background=dark
set colorcolumn=80
