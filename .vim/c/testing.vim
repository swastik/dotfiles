" Vimux runs tests in tmux windows
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" Test mappings
let test#strategy = "vimux"

" Ensure vim-test uses the right command
let test#javascript#jest#executable = 'npm test'
let test#custom_runners = {'JavaScript': ['Qunit']}

nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
