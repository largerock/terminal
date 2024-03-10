#!/usr/bin/env zsh

export ZSH=$HOME/.oh-my-zsh
plugins=(
    git
)

# SAUCE~TIME~~~~~
source "$(dirname $0)/vars.env"
source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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

alias install-gstream="brew install gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly"

alias install-nerdfonts="brew tap homebrew/cask-fonts \
&& brew install --cask font-jetbrains-mono-nerd-font"

alias install-term="brew install --cask iterm2"
alias install-notes="brew install --cask obsidian"
alias install-vcpkg="git clone https://github.com/Microsoft/vcpkg.git ~/vcpkg \
&& cd ~/vcpkg \
&& ./bootstrap-vcpkg.sh \
&& ./vcpkg integrate install"

# define function to install given app with brew cask
function install-cask-app() {
    # check if the app is installed with brew list and also inside the applications folder
    if brew list --cask $1 > /dev/null 2>&1; then
        echo "$1 is already installed"
        return
    elif [ -d "/Applications/$1.app" ]; then
        echo "$1 is already installed"
        return
    else
        brew install --cask $1
    fi
}

function install-app() {
    # check if the app is installed 
    if brew list $1 > /dev/null 2>&1; then
        echo "$1 is already installed"
        return
    else    
        brew install $1
    fi
}

# define function to install each app in a list
function install-cask-apps() {
    echo "Installing apps..."
    # defne the list so that the for loop can iterate over each of th em 
    array="iterm2 visual-studio-code google-chrome firefox slack discord spotify obsidian"

    ODIFS=$IFS
    IFS=" "
    read -A list <<< "$array"
    IFS=$OLDIFS
    
    for app in "${list[@]}"; do
        echo "Installing $app..."
    done
}

function install-apps() {
    # defne the list 
    list="git node cmake docker go starship"
    
    ODIFS=$IFS
    IFS=" "
    read -A list <<< "$list"
    IFS=$OLDIFS

    for app in $list; do
        echo "Installing $app..."
    done
}

# Personal Prefs
alias install-george="\
install-apps \
&& install-vcpkg \
&& install-notes \
&& install-apps
"

alias beans="echo nooooo"

export STARSHIP_CONFIG="$(dirname $0)/starship.toml"

eval "$(starship init zsh)"