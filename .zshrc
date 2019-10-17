# Source zshrc
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Some aliases
alias python=python3
alias vim=nvim
alias v=nvim
alias e='exit'
alias gb='gco $(git branch | fzf-tmux -d 15)'

# Load rbenv
eval "$(rbenv init -)"

# Use fd with FZF. And some FZF settings.
export FZF_DEFAULT_COMMAND="fd . --type file --color always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_gen_fzf_default_opts() {
export FZF_DEFAULT_OPTS="
  --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
  --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
  --bind ctrl-a:select-all
  --ansi
"
}

_gen_fzf_default_opts
