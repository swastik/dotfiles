set nocompatible

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

" Linting
Plug 'w0rp/ale'

" Completion
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

" Search
Plug 'rking/ag.vim'

" FZF for search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

"FZF
set rtp+=~/.fzf
noremap <c-p> :FZF<CR>
noremap <c-b> :Buffers<CR>
noremap <silent> <leader>m :History<CR>

" Languages (I guess?)
Plug 'sheerun/vim-polyglot', { 'tag': 'v3.3.2' }
Plug '1995eaton/vim-better-javascript-completion'

" CSS
Plug '1995eaton/vim-better-css-completion'

" Highlighting
Plug 'slim-template/vim-slim', { 'for': 'slim' }

" Utils
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'itchyny/lightline.vim'

"Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'nightsense/snow'

" Autocomplete
Plug 'roxma/nvim-completion-manager'
Plug 'calebeby/ncm-css'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

call plug#end()

let mapleader=","

" Ensures the colorscheme works
set t_Co=256
set termguicolors

set background=dark
set guifont=Inconsolata-dz\ for\ Powerline:h13
set linespace=1

colorscheme snow
let g:lightline = { 'colorscheme': 'snow_dark' }

nnoremap <silent> <Leader><Enter> :Buffers<CR>

set autoread
set autoindent
set smartindent
set scrolloff=5
set expandtab smarttab
set completeopt=menuone,preview
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set encoding=utf-8
set tabstop=2
set nowrap
set number
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set incsearch
set ignorecase
set smartcase
set list
set listchars=tab:>·,trail:·,extends:>,precedes:<
set directory=~/.vim/_tmp//
set backupdir=~/.vim/backup//
set ttimeout
set ttimeoutlen=1
set colorcolumn=80
set cursorline
set relativenumber
set lazyredraw
" set inccommand=nosplit

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

" Mapping for Ag
nmap <leader>g :Ag<cr>

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
   \ '✘ W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

set laststatus=2
set statusline=
set statusline+=\ %l
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ ››
set statusline+=\ %m
set statusline+=\ %F
set statusline+=%=
set statusline+=\ %{LinterStatus()}
set statusline+=\ ‹‹
set statusline+=\ %{strftime('%R',\ getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*

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
