"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AirLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Format Settings (using Neoformat)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoformat_enabled_python = ['black', 'docformatter']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_try_formatprg = 1
let g:shfmt_opt="-ci"
let g:neoformat_run_all_formatters = 1
augroup filetype_python
    autocmd!
    autocmd FileType python let b:neoformat_run_all_formatters = 1
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-explorer settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-vimlsp settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox colorscheme modifications for CoC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User underline instead of undercurl
hi CocErrorHighlight   cterm=underline gui=underline
hi CocWarningHighlight cterm=underline gui=underline
hi CocInfoHighlight    cterm=underline gui=underline
hi CocHintHighlight    cterm=underline gui=underline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
