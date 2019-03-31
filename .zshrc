# Source zshrc
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias python=python3
alias vim=nvim
alias v=nvim
alias e=exit

export EDITOR=nvim
export FZF_DEFAULT_COMMAND="fd . -t f" # -t f to filter by files
export FZF_DEFAULT_OPTS='
  --color fg:250,bg:0,hl:3,bg+:0,fg+:255,hl+:4
  --color info:36,prompt:244,spinner:255,pointer:36,marker:36
  --bind ctrl-a:select-all
'

# Load rbenv
eval "$(rbenv init -)"
