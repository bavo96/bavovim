#!/bin/bash

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
    apt-get install ripgrep
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    echo "Windows is not supported."
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]; then
    echo "Windows is not supported."
fi 

### Copy neovim config files
bash ./scripts/update_local.sh
