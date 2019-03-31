" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" ncm2 will get the cursor stuck if you use menuone,preview.
" This fixes that. For more info, :help Ncm2PopupOpen
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone,preview
