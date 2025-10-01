# ----
# Funciones
# ----

tmuxp_session() {
  local session_name=$1 # Nombre de la sesión en tmux
  local yaml_file=$2   # Nombre del archivo .yaml (con extensión)
  local session_dir=~/Documents/Dev/Sesiones  

  if [ -z "$session_name" ] || [ -z "$yaml_file" ]; then
    echo "❌ Uso: tmuxp_session <session_name> <yaml_file>"
    return 1
  fi

  if [ -n "$TMUX" ]; then
    # Ya estás dentro de tmux → switch
    if tmux has-session -t "$session_name" 2>/dev/null; then
      echo "🔄 Cambiando a la sesión '$session_name'..."
      sleep 0.5
      tmux switch-client -t "$session_name"
    else
      echo "✨ Creando y cargando la sesión '$session_name' desde '$yaml_file'..."
      sleep 0.5
      cd "$session_dir" && tmuxp load "$yaml_file" && tmux switch-client -t "$session_name"
    fi
  else
    # No estás en tmux → attach o crear
    if tmux has-session -t "$session_name" 2>/dev/null; then
      echo "🔄 Adjuntando a la sesión '$session_name'..."
      sleep 0.5
      tmux attach -t "$session_name"
    else
      echo "✨ Creando y cargando la sesión '$session_name' desde '$yaml_file'..."
      sleep 0.5
      cd "$session_dir" && tmuxp load "$yaml_file"
    fi
  fi
}

# ----
# Integrations/Shells
# ----

# nvm integration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NPM Binaries PATH integration
export PATH="$PATH:$(npm bin -g)"

# Iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# GHCUP (Haskell) environment
# [ -f "/Users/ramirober/.ghcup/env" ] && . "/Users/ramirober/.ghcup/env" # ghcup-env

# jenv (Java Version Manager) PATH integration
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Android SDK PATH integration
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Ruby gems PATH integration
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# GHCUP (Haskell) environment integration
[ -f "/Users/ramiro/.ghcup/env" ] && . "/Users/ramiro/.ghcup/env" # ghcup-env

# My scripts PATH integration
# export PATH="$HOME/Documents/Dev/Ramiro/aus/Sistemas Operativos/scripts:$PATH"

# ----
# My configs
# ----

# Custom prompt
# PROMPT='%1~ %F{green}❯%f '
PROMPT='%1~%F{green}%f '
# Disable last login message
touch ~/.hushlogin
# History management
setopt inc_append_history  # Save commands as they are executed
setopt append_history      # Append to the history file instead of overwriting it
# Disable shared history between tabs
unsetopt share_history
# Default editor
export EDITOR="code"
# Default language
export LANG="en_US.UTF-8"

# ----
# Aliases
# ----

alias dev="cd ~/Documents/Dev"
alias wehealthy="tmuxp_session WeHealthy wehealthy.yaml"
alias aus="tmuxp_session AUS aus.yaml"
alias nvim_config="nvim ~/.config/nvim"

# ----
# Plugins/Extensions
# ----

# ZSH Syntax Highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
