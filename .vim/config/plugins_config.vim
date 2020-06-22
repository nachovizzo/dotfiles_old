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
" => suda plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:suda_smart_edit=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source the standard settings from https://github.com/neoclide/coc.nvim
source ~/.vim/config/coc_default.vim

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent>rn <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)

function! EnableCoc()
    exec "CocEnable"
    set signcolumn=yes
endfunction

function! DisableCoc()
    exec "CocDisable"
    set signcolumn=no
endfunction

" Remap Settings for CoC
nnoremap <silent> <leader>ce :call EnableCoc()<cr>
nnoremap <silent> <leader>cd :call DisableCoc()<cr>
nnoremap <silent> <leader>cr :CocRestart<cr>
nnoremap <silent> <M-o>  :CocCommand clangd.switchSourceHeader<cr>
