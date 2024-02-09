#!/bin/sh
set -e

# check if running on macos or linux and set a variable
if [ "$(uname)" = "Darwin" ]; then
    OS="macos"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    # check if sudo
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root"
        exit
    fi
    OS="linux"
fi

# if running macos install homebrew
if [ "$OS" = "macos" ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    brew install starship zsh-syntax-highlighting zsh-autosuggestions

    echo "Installing oh-my-zsh..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "we're still running"
fi 

# if running linux install zsh
if [ "$OS" = "linux" ]; then
    echo "Installing defaults for linux..."

    sudo apt update
    sudo apt install zsh curl python3 git ssh -y
    curl -fsSL https://starship.rs/install.sh | bash
    ln -s /usr/bin/python3 /usr/bin/python || echo "Exists"
fi
