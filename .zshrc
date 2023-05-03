# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh_custom

# Zsh and Oh my zsh settings
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  git
  # nvm
)

# nvm
# zstyle ':omz:plugins:nvm' lazy true

# Disable bracketed-paste-magic for new shell performance
export DISABLE_MAGIC_FUNCTIONS=true

export HOMEBREW_NO_ANALYTICS=1

source $ZSH/oh-my-zsh.sh

# User configuration
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# gpg
export GPG_TTY=$(tty)

# Editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Shell History
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

# pyenv autocompletion and all subcommands
pyenv() {
  eval "$(command pyenv init -)"
  pyenv "$@"
}

# pythonrc
export PYTHONSTARTUP="$HOME/.pythonrc.py"

# ruby
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Docker autocomplete
zstyle ':completion:*:*:docker:*' option-stacking yes

# lazyload kubectl autocomplete
# Check if 'kubectl' is a command in $PATH
if [ $commands[kubectl] ]; then

  # Placeholder 'kubectl' shell function:
  # Will only be executed on the first call to 'kubectl'
  kubectl() {
    # Remove this function, subsequent calls will execute 'kubectl' directly
    unfunction "$0"

    # Load auto-completion
    source <(kubectl completion zsh)

    # Execute 'kubectl' binary
    $0 "$@"
  }
fi

# IL
export PATH=$PATH:$HOME/Projects/platform-wrapper/bin
export KUBECONFIG=~/.kube/oddjob
