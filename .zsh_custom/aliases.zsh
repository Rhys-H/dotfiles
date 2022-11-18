# MacOS style 'open' command in Linux
case "$OSTYPE" in
   linux*)
      alias open="xdg-open"
      ;;
esac

alias k="kubectl"

alias oj="cd ~/Projects/oddjob && source ./venv/bin/activate"
