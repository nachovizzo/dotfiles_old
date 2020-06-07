" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'nachovizzo/committia.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'Chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "

" Show relaive numers to current line
set number
set relativenumber

" leader keybindings
nmap <leader>w :w<cr>
nmap <leader>q :q!<cr>
nmap <leader>b :Gblame<cr>

" Color and stuff
colorscheme gruvbox
set background=dark
set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

imap jk <ESC>
imap kj <ESC>

let g:airline_powerline_fonts = 1
au BufWrite * :Autoformat

