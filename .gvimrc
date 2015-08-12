set guioptions-=r "remove scrollbars
set guioptions-=R "remove scrollbars
set guioptions-=l "remove scrollbars
set guioptions-=L "remove scrollbars
set guioptions-=T " Remove toolbars
set guioptions-=e " Removes mac-ish toolbars

" although I don't use NERDTree much, this is still useful sometimes
map <Leader>nt :NERDTree<CR>

if has("gui_macvim") || has("gui_vimr")
  let macvim_skip_colorscheme = 1
  set transparency=0
  set fuoptions=maxvert,maxhorz
  set linespace=5
  set lines=45
  set columns=285
  set nolazyredraw
  autocmd VimEnter * exec ":set columns=85"
endif
