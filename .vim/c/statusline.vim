" Partially taken from https://github.com/liuchengxu/eleline.vim/blob/master/plugin/eleline.vim
function! ElelineGitBranch(...) abort
  let l:head = fugitive#head()
  let l:symbol = " \ue0a0 "
  return empty(l:head) ? '' : l:head . ' '
endfunction

function! ElelineGitStatus() abort
  let l:summary = [0, 0, 0]
  if exists('b:sy')
    let l:summary = b:sy.stats
  elseif exists('b:gitgutter.summary')
    let l:summary = b:gitgutter.summary
  endif
  if max(l:summary) > 0
    return ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' '
  endif
  return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%1*\ %n
set statusline+=\ Œû
set statusline+=\ %l/%L
set statusline+=\ Œá
set statusline+=%5*\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=%4*\%{ElelineGitBranch()}
set statusline+=%6*\%{ElelineGitStatus()}

hi StatusLine guibg=colour0
hi User1 guibg=#3B4252 guifg=colour2 gui=bold

hi User5 guibg=#3B4252 guifg=colour2 gui=none
hi User4 guibg=#3B4252 guifg=colour2 gui=bold
hi User6 guibg=#3B4252 guifg=colour2 gui=none

hi User2 guibg=#3B4252 guifg=colour4 gui=none
hi User3 guifg=#3B4252 guifg=colour5 gui=none
