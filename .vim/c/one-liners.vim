" vim-signify
let g:signify_vcs_list = [ 'git' ]

" Copy current buffer's relative path
noremap <c-f> :let @+ = expand("%")<CR>

" Emmet won't recognize JSX. This will fix it.
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

vmap <Enter> <Plug>(EasyAlign)
