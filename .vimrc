set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'scrooloose/syntastic'

Plug 'SirVer/ultisnips'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'valloric/youcompleteme', { 'do': './install.sh' }
Plug 'mattn/emmet-vim'

Plug 'rking/ag.vim'

" FZF for search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

Plug 'elixir-lang/vim-elixir'

" Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

" Rust
Plug 'rust-lang/rust.vim'

" Javascript
Plug 'marijnh/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'

Plug 'mustache/vim-mustache-handlebars'
Plug 'slim-template/vim-slim'
Plug 'mxw/vim-jsx'

" Utils and themes
Plug 'junegunn/vim-easy-align'
" Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-after-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-expand-region'
Plug 'altercation/vim-colors-solarized'
Plug 'jgdavey/vim-turbux'
Plug 'benmills/vimux'

Plug 'reedes/vim-colors-pencil'
Plug 'junegunn/seoul256.vim'
Plug 'ChrisKempson/Vim-Tomorrow-Theme'
Plug 'w0ng/vim-hybrid'
Plug 'gilgigilgil/anderson.vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()

let base16colorspace=256
let mapleader=","
set t_Co=256
colorscheme jellybeans
set guifont=Inconsolata\ for\ Powerline:h13
set linespace=2
let g:seoul256_background = 232

"FZF
set rtp+=~/.fzf
noremap <c-p> :FZF<CR>

nnoremap <silent> <Leader>s :call fzf#run({ 'tmux_height': winheight('.') / 2, 'sink': 'botright split' })<CR>
nnoremap <silent> <Leader>v :call fzf#run({ 'tmux_width': winwidth('.') / 2, 'sink': 'vertical botright split' })<CR>

nnoremap <silent> <Leader>c        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>

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
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,
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

set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\

" Run a macro with space
:nnoremap <Space> @q

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

map <Leader>> :30winc><CR>
map <Leader>< :30winc<<CR>

" cursor
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" setup turbux
let g:turbux_command_rspec = 'bin/rspec'

" Shortcut to remove highlights
noremap <silent><leader>/ :nohlsearch<cr>

" Defines some after object mappings
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" For fzf
nmap <silent> <leader>m :History<CR>

" rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" send to pane
let g:rspec_command = 'call VimuxRunCommand("rspec {spec}\n")'

let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
