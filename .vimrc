" Automatically install plug if not there
source ~/.vim/config/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'antoinemadec/coc-fzf'
Plug 'arzg/vim-colors-xcode'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'kevinoid/vim-jsonc'
Plug 'nachovizzo/committia.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Under evaluation
Plug 'lervag/vimtex'

" New LUA configuration, WIP
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" All the real configuration
source ~/.vim/config/basic.vim
source ~/.vim/config/coc.vim
source ~/.vim/config/functions.vim
source ~/.vim/config/keybindings.vim
source ~/.vim/config/plugins_config.vim
source ~/.vim/config/plugins_keys.vim
source ~/.vim/config/extended.vim

" New LUA configuration, WIP
luafile ~/.vim/config/init.lua
