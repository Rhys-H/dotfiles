brew_prefix="$(brew --prefix)"
eval "$($brew_prefix/bin/brew shellenv)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

