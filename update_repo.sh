# Copy all folders in local config to repo
rsync -a --exclude=coc/ ~/.config .
