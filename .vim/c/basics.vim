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
set directory=~/.vim/_tmp//
set backupdir=~/.vim/backup//
set ttimeout
set ttimeoutlen=1
set colorcolumn=120
set cursorline
set lazyredraw

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

" Stop hl from working too
noremap h <NOP>
noremap l <NOP>

" Open new buffer
nmap <leader>sp :rightbelow vnew<cr>

" Quit with :Q
command! -nargs=0 Quit :qa!

" Make this mistake all the time
command! W w
command! E e
command! Q q
command! Wq wq
command! WQ wq
