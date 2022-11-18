# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh_custom

# Zsh and Oh my zsh settings
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  git
  nvm
)

# nvm
zstyle ':omz:plugins:nvm' lazy true

# Disable bracketed-paste-magic for new shell performance
export DISABLE_MAGIC_FUNCTIONS=true

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
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# pythonrc
export PYTHONSTARTUP="$HOME/.pythonrc.py"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes

# IL
export PATH=$PATH:$HOME/Projects/platform-wrapper/bin
export KUBECONFIG=~/.kube/oddjob
