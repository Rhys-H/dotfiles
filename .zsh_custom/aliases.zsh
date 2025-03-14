# MacOS style 'open' command in Linux
case "$OSTYPE" in
   linux*)
      alias open="xdg-open"
      ;;
esac

alias k="kubectl"

alias hg="history | grep"
