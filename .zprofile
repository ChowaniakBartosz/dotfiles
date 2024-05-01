#!/bin/sh

# ----------------
# CUSTOM VARIABLES
# ----------------

# DEFAULT PROGRAMS
export EDITOR="nvim"
export BROWSER="brave"
export TERMINAL="st"

# CUSTOM PATH
export PATH="$HOME/.local/bin:$PATH"

# CUSTOM CONFIG FILES LOCATIONS
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Aliases
alias stow="stow --target=$HOME"
