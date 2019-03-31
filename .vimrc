syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" Source plugins
source ~/.vim/plugins.vim
set rtp+=~/.fzf
call plug#end()

let mapleader=","

source ~/.vim/c/colors.vim
source ~/.vim/c/basics.vim
source ~/.vim/c/statusline.vim
source ~/.vim/c/testing.vim
source ~/.vim/c/rename.vim

" Plugins
source ~/.vim/c/one-liners.vim
source ~/.vim/c/ncm.vim
source ~/.vim/c/fzf.vim
source ~/.vim/c/ale.vim
source ~/.vim/c/snips.vim
