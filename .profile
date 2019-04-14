# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export VISUAL=vim
export EDITOR="$VISUAL"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export PATH="$PATH:$(du "$HOME/.commands/" | cut -f2 | tr '\n' ':')"

#JetBrains
export PATH="$PATH:$HOME/.programs/clion-2019.1/bin:$HOME/.programs/idea-IU-191.6183.87/bin:$HOME/.programs/pycharm-2019.1.1/bin:$HOME/.programs/WebStorm-191.6183.63/bin:$HOME/.programs/GoLand-2019.1/bin"

#tts
export PATH="$PATH:$HOME/.programs/tts"
