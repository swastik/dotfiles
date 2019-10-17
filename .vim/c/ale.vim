let g:ale_sign_error = '×'
let g:ale_sign_warning = '~'

highlight ALEErrorSign ctermfg=1 ctermbg=234
highlight ALEWarningSign ctermfg=11 ctermbg=234

let g:ale_linters = {
\ 'typescript': ['eslint', 'prettier'],
\ 'javascript': ['eslint', 'prettier'],
\ 'html': ['ember-template-lint'],
\ 'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\}

let g:ale_fix_on_save = 1

nmap <silent> <C-b> <Plug>(ale_previous_wrap)
nmap <silent> <C-l> <Plug>(ale_next_wrap)
