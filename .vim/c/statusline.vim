" ALE Errors
function! LinterWarnings() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:all_non_errors == 0 ? '' : printf('[WARNING] %d', l:all_non_errors)
endfunction

function! LinterErrors() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   return l:all_errors == 0 ? '' : printf('[ERROR] %d', l:all_errors)
endfunction

" Partially taken from https://github.com/liuchengxu/eleline.vim/blob/master/plugin/eleline.vim
function! ElelineGitBranch(...) abort
  let l:head = fugitive#head()
  let l:symbol = " \ue0a0 "
  return empty(l:head) ? '' : l:symbol.l:head . ' '
endfunction

set laststatus=2
set statusline=
set statusline+=\ B%n
set statusline+=\ ·
set statusline+=\ L%l/%L
set statusline+=\ ·
set statusline+=\ %f
set statusline+=\ ·
set statusline+=\ %{ElelineGitBranch()}
set statusline+=%=
set statusline+=\ %{LinterWarnings()}
set statusline+=\ %{LinterErrors()}
