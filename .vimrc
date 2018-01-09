set nocompatible

syntax enable
filetype on
filetype indent on
filetype plugin on

call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/emmet-vim'
Plug 'janko-m/vim-test'
Plug 'roman/golden-ratio'

" Linting
Plug 'w0rp/ale'

" Search
Plug 'rking/ag.vim'

" FZF for search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

"FZF
set rtp+=~/.fzf
noremap <c-p> :FZF<CR>
nmap <silent> <leader>m :History<CR>

" Ruby & Rails
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }

" Javascript
Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'AndrewRadev/ember_tools.vim'

" Highlighting
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'hbs' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'fatih/vim-go', { 'for': 'go' }

" Utils
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Writing
Plug 'junegunn/goyo.vim'

" Themes
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'

" Autocomplete
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'calebeby/ncm-css'
Plug 'fgrsnau/ncm-otherbuf'
Plug 'roxma/ncm-rct-complete'
Plug 'othree/jspc.vim'

call plug#end()

let mapleader=","

" Ensures the colorscheme works
set t_Co=256
set termguicolors

set background=dark
set guifont=Inconsolata-dz\ for\ Powerline:h13
set linespace=1

colorscheme gruvbox

nnoremap <silent> <Leader><Enter> :Buffers<CR>

set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set incsearch
set ignorecase
set smartcase
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:_,
set directory=~/.vim/_tmp//
set backupdir=~/.vim/backup//
set ttimeout
set ttimeoutlen=1
set cursorline
" set relativenumber
set lazyredraw

" Save when losing focus
au FocusLost * :silent! wall

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" No show command
autocmd VimEnter * set nosc

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
map <leader>o :on<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Resize buffers
if bufwinnr(1)
  nmap Ä <C-W><<C-W><
  nmap Ö <C-W>><C-W>>
  nmap ö <C-W>-<C-W>-
  nmap ä <C-W>+<C-W>+
endif

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

" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsExpandTrigger="<c-e>"

set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\

" Run a macro with space
:nnoremap <Space> @q

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" cursor
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Vimux runs tests in tmux windows
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Linting
let g:ale_linters = {
\ 'javascript': ['jshint', 'jscs'],
\ 'handlebars': ['ember-template-lint'],
\ 'ruby': ['rubocop'],
\}

" Enable flow
" let g:flow#enable = 1
" let g:flow#autoclose = 1
" let g:flow#errjump = 1

" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" Test mappings
let test#strategy = "vimux"

" Ensure vim-test uses the right command
let test#javascript#jest#executable = 'npm test'

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

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>c :Gcommit<CR>

"-----------------------------------------------------------------------------
" Prettier
"-----------------------------------------------------------------------------
nnoremap <Leader>pp :silent %!prettier --stdin --no-semi --trailing-comma all --single-quote<CR>

"----------------------------------------------------------------------------------
" ALE
"
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

" Splitjoin's mappings
nmap <Leader>ss :SplitjoinSplit<cr>

" ALE Errors
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
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
