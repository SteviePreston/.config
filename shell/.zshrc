# Export Paths
export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim
export CLAUDE_CONFIG_HOME="$HOME/.config/claude"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export GIT_CONFIG_GLOBAL="$HOME/.config/git/.gitconfig"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"

# Load Config
source ~/.config/bin/setup.sh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(~/.local/bin/mise activate zsh)"
eval "$(starship init zsh)"

# Alias
alias nv="nvim"
alias tf="terraform"
alias la="ls -Fa"
alias ls="ls -F"
alias cdr="project-root"
alias hist="history-exec"
alias fandr="find-replace"
alias gcout="git-checkout"
alias glog="git-log"
alias gstat="git-status"
alias gtags="git-tag-checkout"
alias gclr="git clean -fd && git restore ."
alias brewdate="brew update && brew upgrade"
alias clr="reset && clear"
alias config="cd ~/.config"

# Keybinds
bindkey "^L" autosuggest-accept
bindkey "^P" project-nav-func
bindkey "^H" history-exec-func
bindkey "^T" tmux-session-func
bindkey "^G" git-status-func
