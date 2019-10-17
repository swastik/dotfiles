"FZF
noremap <c-p> :FZF<CR>
noremap <c-b> :Buffers<CR>
noremap <c-n> :History<CR>

" Build a quickfix list with ctrl-a, ctrl-q
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Hide statusline for fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "1;16"', fzf#vim#with_preview(), <bang>0)

" Search for the word under cursor
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" use `:AF` to add missing TS imports / execute other TS server autofixes
command! -nargs=0 AF :call CocAction('runCommand', 'tsserver.executeAutofix')
