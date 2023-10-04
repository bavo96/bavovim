# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH='/home/bavo/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
# https://github.com/ohmybash/oh-my-bash/tree/master/themes/powerline
OSH_THEME="powerline"
# POWERLINE_PROMPT_USER_INFO_MODE="sudo"
# THEME_CLOCK_FORMAT="%d-%m-%Y %H:%M:%S"
POWERLINE_PROMPT="user_info scm python_venv ruby cwd"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_OSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
OMB_PROMPT_SHOW_PYTHON_VENV=true # enable

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: 
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation arch flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"

## source it from ~/.bashrc or ~/.bash_profile ##
# echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc
 
source /etc/profile.d/bash_completion.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# Stop activate base environment anaconda
export CONDA_AUTO_ACTIVATE_BASE=false
__conda_setup="$('/home/bavo/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export CUDA_VERSION=cuda-11.1
export CUDA_HOME=/usr/local/$CUDA_VERSION
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/$CUDA_VERSION/lib64:/usr/local/$CUDA_VERSION/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin

# ibus
export GTK_IM_MODULE=xim # đổi thành xim
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
# Dành cho những phần mềm dựa trên qt4
export QT4_IM_MODULE=ibus
# Dành cho những phần mềm dùng thư viện đồ họa clutter/OpenGL
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=ibus

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
