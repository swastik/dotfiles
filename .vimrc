syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" Source plugins
source ~/dotfiles/.vim/c/plugins.vim
set rtp+=~/.fzf

call plug#end()

let mapleader=","

source ~/dotfiles/.vim/c/colors.vim
source ~/dotfiles/.vim/c/basics.vim
source ~/dotfiles/.vim/c/statusline.vim
source ~/dotfiles/.vim/c/testing.vim
source ~/dotfiles/.vim/c/rename.vim

" Plugins
source ~/dotfiles/.vim/c/coc.vim
source ~/dotfiles/.vim/c/fzf.vim
source ~/dotfiles/.vim/c/ale.vim
source ~/dotfiles/.vim/c/snips.vim
