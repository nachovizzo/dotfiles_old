"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AirLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! EnableCoc()
    exec "CocEnable"
    set signcolumn=yes
    source ~/.vim/config/coc_default.vim
endfunction

function! DisableCoc()
    exec "CocDisable"
    set signcolumn=no
endfunction

" Remap Settings for CoC
nnoremap <silent> <leader>ce :call EnableCoc()<cr>
nnoremap <silent> <leader>cd :call DisableCoc()<cr>
nnoremap <silent> <leader>cr :CocRestart<cr>
