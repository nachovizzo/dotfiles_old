""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader>ce :CocEnable<cr>
nnoremap <silent><leader>ct :CocToggle<cr>
nnoremap <silent><leader>cd :CocDisable<cr>
nnoremap <silent><leader>cr :CocRestart<cr>
nnoremap <silent><leader>co :CocConfig<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Format Keybindings (using Neoformat)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><leader>f  :Neoformat<cr>
xmap <silent><leader>f  :Neoformat<cr>
nmap <silent><leader>or :OR<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-fzf Keybindigs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
nnoremap <silent> <space><space> :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>coc     :<C-u>CocFzfList<CR>
nnoremap <silent> <space>d       :<C-u>CocFzfList diagnostics --current-buf<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-explorer bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><leader>m :CocCommand explorer<cr>
nmap <silent><leader>n :CocCommand explorer --preset floating<cr>
nmap <silent><leader>b :CocCommand explorer --preset buffer<cr>
