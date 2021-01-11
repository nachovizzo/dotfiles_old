" Automatically install plug if not there
source ~/.vim/config/plug.vim

call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'nachovizzo/committia.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
call plug#end()

" coc.nvim extensions
let g:coc_global_extensions = [
    \'coc-json',
    \'coc-yaml',
    \'coc-vimlsp',
    \'coc-sh',
    \'coc-pyright',
    \'coc-json',
    \'coc-cmake',
    \'coc-clangd'
\]

" All the real configuration
source ~/.vim/config/basic.vim
source ~/.vim/config/coc.vim
source ~/.vim/config/functions.vim
source ~/.vim/config/keybindings.vim
source ~/.vim/config/plugins_config.vim
source ~/.vim/config/extended.vim
