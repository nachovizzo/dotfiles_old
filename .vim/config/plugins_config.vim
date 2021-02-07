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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neoformat settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoformat_enabled_python = ['autopep8', 'docformatter', 'isort']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_run_all_formatters = 1
let g:neoformat_try_formatprg = 1
let g:shfmt_opt="-ci"
