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
" allow to scroll in the preview
set mouse=a

" mappings
nnoremap <silent> <space><space> :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>cm      :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>coc     :<C-u>CocFzfList<CR>
nnoremap <silent> <space>d       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>rs      :<C-u>CocFzfListResume<CR>
