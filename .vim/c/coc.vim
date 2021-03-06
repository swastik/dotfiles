set updatetime=300
set cmdheight=2

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-ember'
\ ]

let g:coc_filetype_map = {
  \ 'html.handlebars': 'handlebars'
  \ }

" Better display for messages
set cmdheight=2

" Remap keys for gotos
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Quickfix current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight colors
hi! CocErrorSign guifg=#cf8164
hi! CocInfoSign guibg=#5b5f71
hi! CocWarningSign guifg=#d2b45f
