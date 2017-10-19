
# Secrets
source ~/.ssh/secrets.sh

# Scripts
source ~/.scripts/rmb.sh # Remove merged remote and local branchs

# Colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

# Editor
export EDITOR="vim"

# PS1
ps1_rvm="\[[31m\]\$(~/.rvm/bin/rvm-prompt u g)\[[33m\]"
ps1_git="\$(__git_ps1 \"(%s)\")\[[32m\]"
ps1_host="\u\[[37m\]@\[[1m\]\[[32m\]\h"
ps1_path="\[[1m\]\[[36m\]\w\[[1m\]\[[37m\]"
ps1_etc="\[[0m\]"

PS1="$ps1_rvm $ps1_git $ps1_host:$ps1_path\$ $ps1_etc"

# Git
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

# Android
#export ANDROID_HOME=$HOME/projects/android/sdk
#export ANDROID_SDK_HOME=$HOME/projects/android/sdk
#export ANDROID_NDK_HOME=$HOME/projects/android/ndk
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/android-4.2.2

# C
export CFLAGS="-Wall"

# Mruby
#export PATH=$PATH:$HOME/projects/c/mruby/bin
export PATH=$PATH:$HOME/projects/github.com/cloudwalkio/around_the_world/mruby/bin

# CloudWalk
#export CLOUDWALK_ENV=staging
export MRBC="env mrbc"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Emscripten
#export PATH=$PATH:/Users/thiagoscalone/projects/cloudwalk/emsdk_portable:/Users/thiagoscalone/projects/cloudwalk/emsdk_portable/clang/e1.30.0_64bit:/Users/thiagoscalone/projects/cloudwalk/emsdk_portable/node/0.12.2_64bit/bin:/Users/thiagoscalone/projects/cloudwalk/emsdk_portable/emscripten/1.30.0
#export EMSCRIPTEN=/Users/thiagoscalone/projects/cloudwalk/emsdk_portable/emscripten/1.30.0

# RVM
# This loads RVM into a shell session.
export rvm_pretty_print_flag=1
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
