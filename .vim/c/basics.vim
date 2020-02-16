let mapleader=","

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
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set incsearch
set ignorecase
set smartcase
set list
set listchars=tab:..,trail:·
set fillchars=vert:\|,fold:-
set directory=~/.vim/_tmp//
set backupdir=~/.vim/backup//
set ttimeout
set ttimeoutlen=1
set colorcolumn=120
set cursorline
set lazyredraw
set breakindent

set conceallevel=2
let g:vim_markdown_conceal = 0

set pumblend=0
set wildoptions=pum

if has('nvim')
  set inccommand=nosplit
endif

set wildignore+=*/vendor/**
set wildignore+=*/tmp/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**
set wildignore+=*/build/**
set wildignore+=*/log/**

" Stop the arrow keys from working
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" In insert mode too
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Open new buffer
nmap <leader>sp :rightbelow vnew<cr>

" Quit with :Q
command! -nargs=0 Quit :qa!

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Make this mistake all the time
command! W w
command! E e
command! Q q
command! Wq wq
command! WQ wq

" Code folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set termencoding=utf-8

" netrw customizations
let g:netrw_liststyle = 3    " use the tree list view
let g:netrw_banner = 0       " hide the banner
let g:netrw_browse_split = 1 " open new files in a vertical split

" Copy current buffer's relative path
noremap <c-f> :let @+ = expand("%")<CR>

vmap <Enter> <Plug>(EasyAlign)

" Open netrw for the current file
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR><CR>

" Some go stuff
"autocmd FileType go set noexpandtab
autocmd FileType go set preserveindent
autocmd FileType go set softtabstop=0
autocmd FileType go set shiftwidth=2
autocmd FileType go set tabstop=2
autocmd FileType go set listchars=tab:\ \ ,trail:.,extends:#,nbsp:.

" vim-go: use goimports instead of gofmt
let g:go_fmt_command = "goimports"
