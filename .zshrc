# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# PATH
export PATH="~/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

# Get rbenv going
eval "$(rbenv init -)"

# Write some aliases
export EDITOR='/usr/local/bin/nvim'
alias vim='/usr/local/bin/nvim'
alias v=vim
alias rc='rails console'
alias rdm='rake db:migrate'
alias be='bundle exec'
alias e=exit

# Use fd
export FZF_DEFAULT_COMMAND="fd . -t f" # -t f to filter by files
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set the color of autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

# Up and down arrow keys to search forward and backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Load NVM
export NVM_DIR="/Users/swastik/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NODE_OPTIONS="--max_old_space_size=4096"
export GPG_TTY=$(tty)
export PURE_PROMPT_SYMBOL=ϟ
