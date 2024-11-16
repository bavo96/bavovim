#!/bin/bash

usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo " -h, --help      Display this help message"
    echo " -p, --pre       FILE Specify an output file"
    echo " -n, --neovim    Install neovim"
}

install_pre=0
install_neovim=0

# Loop through all the arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
    -p | --pre)
        install_pre=1
        ;;
    -n | --neovim)
        install_neovim=1
        ;;
    -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
done

if [[ $install_pre == 1 ]]; then
    echo "Installing necessary package for neovim..."

    ### Install necessary packages for python
    if [[ "$(python3 -V)" =~ "Python 3" ]]; then
        echo "Python $(python3 -V) is installed. Installing necessary packages..."
        pip install -r requirements.txt
    else
        echo "Python is not installed. Please install python3 and try again."
    fi

    ### Install necessary packages for OS
    if [[ "$(uname)" == "Darwin" ]]; then
        echo "MacOS detected. Installing necessary packages..."
        brew install ripgrep
    elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
        echo "Linux detected. Installing necessary packages..."
        sudo apt-get install ripgrep
    elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
        echo "Windows is not supported."
    elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]; then
        echo "Windows is not supported."
    fi
fi

if [[ $install_neovim == 1 ]]; then
    echo "Installing neovim..."
    ### Copy neovim config files
    bash ./scripts/update_local.sh
fi
