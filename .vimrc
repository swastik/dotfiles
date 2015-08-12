set nocompatible

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Essential plugins
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-commentary'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'valloric/youcompleteme'
Plugin 'mattn/emmet-vim'

" Rails
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'

" Rust
Plugin 'rust-lang/rust.vim'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'slim-template/vim-slim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'heavenshell/vim-jsdoc'

" Utils and themes
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chriskempson/base16-vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'junegunn/seoul256.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ChrisKempson/Vim-Tomorrow-Theme'
Plugin 'terryma/vim-expand-region'
Plugin 'w0ng/vim-hybrid'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

let base16colorspace=256
let mapleader=","
set t_Co=256
set background=light
colorscheme pencil
set guifont=Inconsolata\ for\ Powerline:h13
set linespace=4
" let g:seoul256_background = 237
" let g:airline_theme = 'pencil'

" set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
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
" set relativenumber
" set colorcolumn=80
set listchars=tab:›\ ,eol:¬,trail:⋅ " Better chars
set directory=~/.vim/_tmp//
set backupdir=~/.vim/backup//

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

" Quick ESC
imap jj <ESC>

" Stop the arrow keys from working
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Stop hl from working too
noremap h <NOP>
noremap l <NOP>

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

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

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg', 'build']
let NERDTreeWinSize=26

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 8
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/vendor/**
set wildignore+=*/tmp/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**
set wildignore+=*/build/**
set wildignore+=*/log/**

" Quit with :Q
command! -nargs=0 Quit :qa!

" Make this mistake all the frickin' time
command! W w
command! E e
command! Q q
command! Wq wq
command! WQ wq

let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

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

" Code folding /yep
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsExpandTrigger="<c-e>"

" Syntastic highlights everything in the world otherwise
let g:syntastic_mode_map = { 'mode': 'passive' }

" Set stuff to XTERM
" set term=xterm-256color
set termencoding=utf-8
" set fillchars+=stl:\ ,stlnc:\

" Run a macro with space
:nnoremap <Space> @q

" although I don't use NERDTree much, this is still useful sometimes
map <Leader>nt :NERDTree<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

map <Leader>> :30winc><CR>
map <Leader>< :30winc<<CR>

" cursor
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" setup turbux
let g:turbux_command_rspec  = 'bin/rspec'

" Shortcut to remove highlights
noremap <silent><leader>/ :nohlsearch<cr>
