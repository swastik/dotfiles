set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'

Plug 'SirVer/ultisnips'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/emmet-vim'

" Linting
Plug 'w0rp/ale'

" Search
Plug 'rking/ag.vim'

" FZF for search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

" Ruby & Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

" Javascript
Plug 'marijnh/tern_for_vim'
Plug 'pangloss/vim-javascript'

" Lightline
Plug 'itchyny/lightline.vim'

" Highlighting
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'

Plug 'mustache/vim-mustache-handlebars'
Plug 'slim-template/vim-slim'

" Utils and themes
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/vim-turbux'
Plug 'benmills/vimux'

Plug 'roman/golden-ratio'
Plug 'AndrewRadev/ember_tools.vim', { 'for': ['handlebars', 'javascript'] }
Plug 'w0ng/vim-hybrid'

" Autocomplete
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/echodoc.vim'
Plug 'othree/jspc.vim'

call plug#end()

let mapleader=","
set background=dark
set guifont=Fira\ Code:h15
set linespace=2

colorscheme hybrid

"FZF
set rtp+=~/.fzf
noremap <c-p> :FZF<CR>

nnoremap <silent> <Leader>s :call fzf#run({ 'tmux_height': winheight('.') / 2, 'sink': 'botright split' })<CR>
nnoremap <silent> <Leader>v :call fzf#run({ 'tmux_width': winwidth('.') / 2, 'sink': 'vertical botright split' })<CR>

nnoremap <silent> <Leader>c        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>

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
set lcs=tab:▸\ ,trail:·,nbsp:_,
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
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsExpandTrigger="<c-e>"

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

" For fzf
nmap <silent> <leader>m :History<CR>

" rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" send to pane
let g:rspec_command = 'call VimuxRunCommand("bin/rspec {spec}\n")'

let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

let g:jsx_ext_required = 0
let g:jsdoc_allow_input_prompt = 1

""""""""""""""""""""""""""""
""""""""NEOCOMPLETE"""""""""
""""""""""""""""""""""""""""

" Start neocomplete
let g:neocomplete#enable_at_startup = 1

" Tab to complete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Close popup
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Autocomplete-like
let g:neocomplete#enable_auto_select = 1

" Disable preview window
set completeopt-=preview

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Linting
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'saas': ['saas-lint']
\}

" Echodoc
set cmdheight=2
let g:echodoc_enable_at_startup = 1
