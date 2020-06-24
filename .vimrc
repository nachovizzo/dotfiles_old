call plug#begin('~/.vim/plugged')

Plug 'Chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'nachovizzo/committia.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'

" Pluc coc-nvim on first call
Plug 'neoclide/coc.nvim', { 'on': 'CocEnable' }

" Initialize plugin system
call plug#end()

" All the real configuration
source ~/.vim/config/basic.vim
source ~/.vim/config/keybindings.vim
source ~/.vim/config/plugins_config.vim
source ~/.vim/config/extended.vim
