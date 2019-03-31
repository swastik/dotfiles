let g:ale_sign_error = '×'
let g:ale_sign_warning = '~'

highlight ALEErrorSign ctermfg=1 ctermbg=234
highlight ALEWarningSign ctermfg=11 ctermbg=234

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'html': ['ember-template-lint'],
\ 'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}

let g:ale_fix_on_save = 1
