#!/bin/bash

bash ./scripts/update_local.sh
pip install -r requirements.txt

# if [ "$(uname)" == "Darwin" ]; then
#     brew install 
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
# elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
#     echo "Windows is not supported"
# elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
#     echo "Windows is not supported"
# fi 
