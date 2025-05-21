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
  # docker
  git
  nvm
)

# nvm
zstyle ':omz:plugins:nvm' lazy yes

# Disable bracketed-paste-magic for new shell performance
export DISABLE_MAGIC_FUNCTIONS=true

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTOREMOVE=1

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
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE

# pyenv autocompletion and all subcommands
pyenv() {
  eval "$(command pyenv init -)"
  pyenv "$@"
}

# pythonrc
export PYTHONSTARTUP="$HOME/.pythonrc.py"

# datadogpy disable any statsd metric collection
export DD_DOGSTATSD_DISABLE=True
export DD_INSTRUMENTATION_TELEMETRY_ENABLED=False

# ruby
# rbenv() {
#   eval "$(command rbenv init -)"
#   rbenv "$@"
# }

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Docker autocomplete
# zstyle ':completion:*:*:docker:*' option-stacking yes

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

# Pomodoro CLI
# Uses:
# https://github.com/caarlos0/timer
# https://github.com/julienXX/terminal-notifier
work() {
  # usage: work 10m, work 60s etc. Default is 25m
  timer "${1:-25m}" && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -sound Crystal
}

rest() {
  # usage: rest 10m, rest 60s etc. Default is 15m
  timer "${1:-15m}" && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -sound Crystal
}

pomodoro() {
  # Work for 25 minutes, then take a 5 minute break. After 4 cycles, take a 15 minute break.
  # usage: pomodoro [work_time] [short_break] [long_break]
  # default: pomodoro 25m 5m 15m

  local work_time="${1:-25m}"
  local short_break="${2:-5m}"
  local long_break="${3:-15m}"
  local cycles=4
  local current_cycle=1

  echo "🍅 Starting Pomodoro Technique"
  echo "🔄 Work: $work_time | Short Break: $short_break | Long Break: $long_break"

  while true; do
    echo "▶️ Cycle $current_cycle/$cycles: Starting work session..."
    work "$work_time"

    # Check if we completed all cycles
    if [ $current_cycle -eq $cycles ]; then
      echo "🎉 All $cycles cycles completed! Taking a longer break: $long_break"
      rest "$long_break"
      current_cycle=1
      echo "🔄 Restarting Pomodoro cycles..."
    else
      echo "✅ Work session complete! Taking a short break: $short_break"
      rest "$short_break"
      ((current_cycle++))
    fi

    # Ask if the user wants to continue
    echo "Press Enter to continue or Ctrl+C to exit..."
    read -rs || break
  done
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# Invoke tab-completion script to be sourced with the Z shell.
# Known to work on zsh 5.0.x, probably works on later 4.x releases as well (as
# it uses the older compctl completion system).

_complete_invoke() {
    # `words` contains the entire command string up til now (including
    # program name).
    #
    # We hand it to Invoke so it can figure out the current context: spit back
    # core options, task names, the current task's options, or some combo.
    #
    # Before doing so, we attempt to tease out any collection flag+arg so we
    # can ensure it is applied correctly.
    collection_arg=''
    if [[ "${words}" =~ "(-c|--collection) [^ ]+" ]]; then
        collection_arg=$MATCH
    fi
    # `reply` is the array of valid completions handed back to `compctl`.
    # Use ${=...} to force whitespace splitting in expansion of
    # $collection_arg
    reply=( $(invoke ${=collection_arg} --complete -- ${words}) )
}


# Tell shell builtin to use the above for completing our given binary name(s).
# * -K: use given function name to generate completions.
# * +: specifies 'alternative' completion, where options after the '+' are only
#   used if the completion from the options before the '+' result in no matches.
# * -f: when function generates no results, use filenames.
# * positional args: program names to complete for.
compctl -K _complete_invoke + -f invoke inv
