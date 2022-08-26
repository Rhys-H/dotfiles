brew_prefix="$(brew --prefix)"
eval "$($brew_prefix/bin/brew shellenv)"

# Docker Buildkit
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
