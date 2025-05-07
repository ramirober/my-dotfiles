# ----
# Integrations/Shells
# ----

# Iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# GHCUP (Haskell) environment
[ -f "/Users/ramirober/.ghcup/env" ] && . "/Users/ramirober/.ghcup/env" # ghcup-env

# ----
# My configs
# ----

# Custom prompt
PROMPT='%1~ %F{green}❯%f '
# Disable last login message
touch ~/.hushlogin
# History management
setopt inc_append_history  # Save commands as they are executed
setopt append_history      # Append to the history file instead of overwriting it
# Disable shared history between tabs
unsetopt share_history
# Default editor
export EDITOR="nvim"
# Default language
export LANG="en_US.UTF-8"

# ----
# Aliases
# ----

# Python alias
alias python=/usr/bin/pyenv

# ----
# Plugins/Extensions
# ----

# ZSH Syntax Highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
