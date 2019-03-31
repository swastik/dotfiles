" vim-signify
let g:signify_vcs_list = [ 'git' ]

" Correct highlight for the signify background
highlight SignColumn guibg=#282c34

" Copy current buffer's relative path
noremap <c-f> :let @+ = expand("%")<CR>

" Emmet won't recognize JSX. This will fix it.
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

vmap <Enter> <Plug>(EasyAlign)
