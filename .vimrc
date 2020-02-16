syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" Source plugins
source ~/dotfiles/vim/plugins.vim
set rtp+=~/.fzf

call plug#end()

let mapleader=","
color plain

source ~/dotfiles/vim/basics.vim
source ~/dotfiles/vim/rename.vim

" Plugins
source ~/dotfiles/vim/coc.vim
source ~/dotfiles/vim/fzf.vim
