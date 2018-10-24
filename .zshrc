# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# PATH
export PATH="~/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# Get rbenv going
eval "$(rbenv init -)"

# Write some aliases
export EDITOR='/usr/local/bin/nvim'

alias vim="/usr/local/bin/nvim"
alias rc="rails console"
alias rdm="rake db:migrate"
alias be="bundle exec"

# Ensure filtering by ag before passing on to FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='
  --color fg:243,bg:255,hl:21,fg+:232,bg+:254,hl+:21
  --color info:108,prompt:109,spinner:108,pointer:21,marker:168
'

# Set the color of autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

# Up and down arrow keys to search forward and backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Load NVM
export NVM_DIR="/Users/swastik/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$PATH"

# Apply snow
[ -n "$PS1" ] && sh ~/.vim/plugged/snow/shell/snow_dark.sh
