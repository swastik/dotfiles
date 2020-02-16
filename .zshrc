# turn on autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export GOPATH=~/code
export PATH=$PATH:$GOPATH/bin

export CLICOLOR=1

alias gs='git status -b -s --ignore-submodules=dirty'
alias gco='git checkout'
alias gd='git diff'
alias gc='git commit'
alias v='nvim'
alias vim='nvim'
alias tx='tmuxinator'
alias testchrome='mkdir -p ~/chrome-tmp && /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security --user-data-dir="~/chrome-tmp"'

# well, ember
# alias ember='./node_modules/ember-cli/bin/ember'

# pipe fzf through fd
export FZF_DEFAULT_COMMAND="fd . --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# Install gems to the correct place. Helps avoid permission errors.
export GEM_HOME="$HOME/.gem"

# fnm: manage node
eval "$(fnm env --multi)"

# initialise rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Configuration for the lean prompt
PROMPT_LEAN_TMUX=""

# source prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
