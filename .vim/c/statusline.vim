" ALE Errors
function! LinterWarnings() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:all_non_errors == 0 ? '' : printf('%2*\ · %d [WARNING]', l:all_non_errors)
endfunction

function! LinterErrors() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   return l:all_errors == 0 ? '' : printf('%3*\ · %d [ERROR]', l:all_errors)
endfunction

" Partially taken from https://github.com/liuchengxu/eleline.vim/blob/master/plugin/eleline.vim
function! ElelineGitBranch(...) abort
  let l:head = fugitive#head()
  let l:symbol = " \ue0a0 "
  return empty(l:head) ? '' : l:symbol.l:head . ' '
endfunction

set laststatus=2
set statusline=
set statusline+=%1*\ %n
set statusline+=\ Ξ
set statusline+=\ %l/%L
set statusline+=\ ·
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{ElelineGitBranch()}
set statusline+=\ %{LinterWarnings()}
set statusline+=\ %{LinterErrors()}

hi StatusLine guibg=#21242b
hi User2 guifg=#21242b guibg=#e5c07b
hi User3 guifg=#21242b guibg=#e06c75
hi StatusLineNC guifg=#21242b guibg=#21242b
