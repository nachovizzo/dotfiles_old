"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AirLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-fzf settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
nnoremap <silent> <space><space> :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>coc     :<C-u>CocFzfList<CR>
nnoremap <silent> <space>d       :<C-u>CocFzfList diagnostics --current-buf<CR>
