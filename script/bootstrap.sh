#!/bin/sh
set -e

# check if running on macos or linux and set a variable
if [ "$(uname)" == "Darwin" ]; then
    OS="macos"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    OS="linux"
fi

function install_vcpkg {
    echo "Installing vcpkg"
    # clone vcpkg to the home dir
    git clone https://github.com/Microsoft/vcpkg.git ~/vcpkg
    cd ~/vcpkg
    ./bootstrap-vcpkg.sh
    ./vcpkg integrate install
}




# if running macos install homebrew
if [ "$OS" == "macos" ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    install_vcpkg

    # add the CMAKE_TOOLCHAIN_FILE variable to the .zshrc file
    echo "export CMAKE_TOOLCHAIN_FILE=~/vcpkg/scripts/buildsystems/vcpkg.cmake" >> ~/.zshrc

    

    # install cmake, git and oh-my-zsh
    # brew install cmake 

    echo "Installing Homebrew packages..."

fi



