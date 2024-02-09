#!/bin/sh
set -e

# cd "$(dirname $0)/.."
echo "Current directory: $PWD"

# check if already running as zsh, if not then change default shell to zsh (check where the zsh binary is located also)
if [ "$(ps -p $$ -ocomm=)" != "zsh" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(grep /zsh$ /etc/shells | tail -1)"
fi


# check if running on macos or linux and set a variable
if [ "$(uname)" = "Darwin" ]; then
    echo "source $PWD/src/darwin_config.zsh" > ~/.zshrc
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    echo "source $PWD/src/linux_config.zsh" > ~/.zshrc
fi

echo "Please log out and log back in"
