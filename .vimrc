syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'janko-m/vim-test'
Plug 'roman/golden-ratio'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-slash'
Plug 'rking/ag.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Go stuff
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go'

" Linting
Plug 'w0rp/ale'

" Completion
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

" FZF for search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

"FZF
set rtp+=~/.fzf
noremap <c-p> :FZF<CR>
noremap <c-b> :Buffers<CR>
noremap <c-n> :History<CR>

" Languages (I guess?)
Plug 'sheerun/vim-polyglot', { 'tag': 'v3.3.2' }
Plug '1995eaton/vim-better-javascript-completion'
Plug 'mustache/vim-mustache-handlebars'

" CSS
Plug '1995eaton/vim-better-css-completion'

" Highlighting
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Utils
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'AndrewRadev/splitjoin.vim'

"Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Themes
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'fmoralesc/molokayo'
Plug 'andreypopp/vim-colors-plain'
Plug 'w0ng/vim-hybrid'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'calebeby/ncm-css'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" Plugins for completions
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'wellle/tmux-complete.vim'

" Import completion magic
Plug 'galooshi/vim-import-js'

call plug#end()

let mapleader=","

" Ensures the colorscheme works
set t_Co=256
set termguicolors

set guifont="PragmataPro Mono Liga"
set linespace=1

set background=dark

let g:two_firewatch_italics=1
colorscheme two-firewatch

set autoread
set autoindent
set smartindent
set scrolloff=5
set expandtab smarttab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set encoding=utf-8
set tabstop=2
set nowrap
" set number
" set relativenumber
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set incsearch
set ignorecase
set smartcase
set list
set listchars=tab:..,trail:·
set directory=~/.vim/_tmp//
set backupdir=~/.vim/backup//
set ttimeout
set ttimeoutlen=1
set colorcolumn=120
set cursorline
set lazyredraw
set inccommand=nosplit

" ncm2 will get the cursor stuck if you use menuone,preview.
" This fixes that. For more info, :help Ncm2PopupOpen
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

function! StripSpaces()
  exec ':%s/\s\+$//e'
endfunction

" Automatic formatting
au BufWritePre * :call StripSpaces()
au BufNewFile * set noeol

" Stop the arrow keys from working
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Stop hl from working too
noremap h <NOP>
noremap l <NOP>

" Open new buffers
nmap <leader>s<left> :leftabove vnew<cr>
nmap <leader>s<right> :rightbelow vnew<cr>
nmap <leader>s<up> :leftabove new<cr>
nmap <leader>s<down> :rightbelow new<cr>

" Close everything but this
map <leader>qa :on<cr>

" Close this
map <leader>q :q<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

set wildignore+=*/vendor/**
set wildignore+=*/tmp/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**
set wildignore+=*/build/**
set wildignore+=*/log/**

" Quit with :Q
command! -nargs=0 Quit :qa!

" Make this mistake all the time
command! W w
command! E e
command! Q q
command! Wq wq
command! WQ wq

" Mapping for renaming files
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" Code folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\

" Run a macro with space
:nnoremap <Space> @q

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" Vimux runs tests in tmux windows
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" au FileType css setlocal omnifunc=csscomplete#CompleteCSS
" au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" au FileType python setlocal omnifunc=pythoncomplete#Complete
" au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Linting
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'html': ['ember-template-lint'],
\ 'ruby': ['rubocop'],
\}

" Test mappings
let test#strategy = "vimux"

" Ensure vim-test uses the right command
let test#javascript#jest#executable = 'npm test'
let test#custom_runners = {'JavaScript': ['Qunit']}

nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Emmet won't recognize JSX. This will fix it.
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

"-----------------------------------------------------------------------------
" Prettier
"-----------------------------------------------------------------------------
nnoremap <Leader>pp :silent %!prettier --stdin all --single-quote<CR>

"----------------------------------------------------------------------------------
" ALE
" Customizes how ALE shows up
"----------------------------------------------------------------------------------

let g:ale_sign_error = '×'
let g:ale_sign_warning = '~'

highlight ALEErrorSign ctermfg=1 ctermbg=234
highlight ALEWarningSign ctermfg=11 ctermbg=234

" Disable it on hbs files
let g:ale_pattern_options = {
\   '.*\.hbs$': {'ale_enabled': 0},
\}

" ALE Errors
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '✓' : printf(
   \ '✘ Warnings: %d Errors: %d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

" Partially taken from
" https://github.com/liuchengxu/eleline.vim/blob/master/plugin/eleline.vim
function! ElelineGitBranch(...) abort
  let l:head = fugitive#head()
  let l:symbol = " \ue0a0 "
  return empty(l:head) ? '…' : l:symbol.l:head . ' '
endfunction

set laststatus=2
set statusline=
set statusline+=\ %m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{ElelineGitBranch()}
set statusline+=\ ·
set statusline+=\ %l
set statusline+=\ ·
set statusline+=\ %{LinterStatus()}

" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsExpandTrigger="<c-e>"

let g:UltiSnipsSnippetsDir = $HOME."/.config/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/UltiSnips']

" Hide statusline for fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" vim-signify
let g:signify_vcs_list = [ 'git' ]

" Copy current buffer's relative path
noremap <c-f> :let @+ = expand("%")<CR>

" Build a quickfix list with ctrl-a, ctrl-q
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Fugitive shortcuts
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
