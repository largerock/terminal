#!/usr/bin/env zsh

export ZSH=$HOME/.oh-my-zsh
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# SAUCE~TIME~~~~~
source "$(dirname $0)/vars.env"
source $ZSH/oh-my-zsh.sh

# ~~~~~~~~~~~~~~~~~~~
# Alias (an alias is just a custom command that you can run once this has been setup as the source for your zsh)

# Easy jump into a container (easy mode docker stuff)
alias boop="docker run --rm -it"
alias ubuntu="boop ubuntu"
alias centos="boop centos"
alias debian="boop debian"
alias alpine="boop alpine"
alias fedora="boop fedora"
alias suse="boop opensuse/leap bash"

# Git
alias nuke="git reset --hard HEAD && git clean -df" # -x

# Project Init
alias projinit="mkdir -p script && touch LICENSE README.md CONTRIBUTING.md script/test.sh script/bootstrap.sh"

# Cmake
alias build="cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja && cmake --build build"

# Update
alias up="brew update"

alias install-nerdfonts="brew tap homebrew/cask-fonts \
&& brew install --cask font-jetbrains-mono-nerd-font"

alias install-term="brew install --cask iterm2"
alias install-notes="brew install --cask obsidian"
alias install-vcpkg="git clone https://github.com/Microsoft/vcpkg.git ~/vcpkg \
&& cd ~/vcpkg \
&& ./bootstrap-vcpkg.sh \
&& ./vcpkg integrate install"

# Personal Prefs
alias install-george="\
brew install --cask \
    nano \
	keepassx \
	cmake \
    git \
    node \
    go \
    docker \
    discord \
    starship \
    visual-studio-code \
    oh-my-zsh \
    spotify \
&& install-vcpkg \
&& install-notes
"

alias beans="echo nooooo"

export STARSHIP_CONFIG="$(dirname $0)/starship.toml"

eval "$(starship init zsh)"