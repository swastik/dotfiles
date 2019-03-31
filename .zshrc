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
  --color fg:#abb2bf,bg:0,hl:#6e88a6,bg+:0,fg+:255,hl+:#6e88a6
  --color info:#c8ae9d,prompt:244,spinner:255,pointer:#e06c75,marker:#c8ae9d
  --bind ctrl-a:select-all
'

# Load rbenv
eval "$(rbenv init -)"
