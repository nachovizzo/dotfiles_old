call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'nachovizzo/committia.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

" Pluc coc-nvim on first call
Plug 'neoclide/coc.nvim', { 'on': 'CocEnable' }

" Initialize plugin system
call plug#end()

" All the real configuration
source ~/.vim/config/basic.vim
source ~/.vim/config/filetypes.vim
source ~/.vim/config/keybindings.vim
source ~/.vim/config/plugins_config.vim
source ~/.vim/config/extended.vim
