" Ensure vim-test uses the right command
let test#javascript#jest#executable = 'npm test'
let test#custom_runners = {'JavaScript': ['Qunit']}

nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>

let test#strategy = "neovim"
