# MacOS style 'open' command in Linux
case "$OSTYPE" in
   linux*)
      alias open="xdg-open"
      ;;
esac

# MacOS To fix brew doctor's warning ""config" scripts exist outside your system or Homebrew directories"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

alias k="kubectl"

alias oj="cd ~/Projects/oddjob && source ./venv/bin/activate"
