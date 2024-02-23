export ZSH="/Users/beto0607/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

# Python
export PYENV_ROOT="$HOME/.pyenv"
PYTHON_PATHS="$PYENV_ROOT/bin"

# Android/Flutter/Java
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_STUDIO="$HOME/Android/android-studio"
export FLUTTER_PATH="$HOME/Flutter/bin"
export ANDROID_TOOLS="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/cmdline-tools/bin"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

ANDROID_PATHS="$ANDROID_TOOLS:$ANDROID_STUDIO/bin:$FLUTTER_PATH"

# XDG config folder
export XDG_CONFIG_HOME="$HOME/.config"

# .local folder
LOCAL_FOLDER="$HOME/.local/"

# Go lang
export GO_LANG_HOME="/usr/local/go/bin"
export GOPATH="$HOME/go"
GO_LANG_PATHS="$GOPATH/bin:$GO_LANG_HOME"

# ComposeInfra
export USERPROFILE=$HOME;
export COMPUTERNAME=$HOSTNAME;

# NPM
NPM_PACKAGES="$HOME/.npm-packages"
NPM_PATHS="$NPM_PACKAGES/bin"

# Mine
export BETO_PATH="$HOME/Beto/"
export SHELL_SCRIPTS_PATH="$BETO_PATH/shell_scripts"
export HOME_BIN="$HOME/bin"
BETO_PATHS="$SHELL_SCRIPTS_PATH/bin:$HOME_BIN"

# SpotifyD
export SPOTIFYD="$HOME/spotify/spotifyd/target/release/"

MY_PATH="$BETO_PATHS:$SPOTIFYD:$LOCAL_FOLDER"

# PATH
export PATH="$GO_LANG_PATHS:$NPM_PATHS:$ANDROID_PATHS:$PYTHON_PATHS:$MY_PATH:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Scripts
alias "xC=xclip"
alias "xc=xclip -selection clipboard"
alias "xv=xclip -o"

source $SHELL_SCRIPTS_PATH/aliases/init.sh

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source /home/beto0607/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

