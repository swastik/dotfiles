syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

source ~/dotfiles/vim/plugins.vim
set rtp+=~/.fzf

call plug#end()

let mapleader=","

colorscheme plain

source ~/dotfiles/vim/basics.vim
source ~/dotfiles/vim/rename.vim

" Plugins
source ~/dotfiles/vim/coc.vim
source ~/dotfiles/vim/fzf.vim
source ~/dotfiles/vim/testing.vim
source ~/dotfiles/vim/statusline.vim
