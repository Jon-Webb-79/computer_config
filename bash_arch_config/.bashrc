# .bashrc file
# ==============================================================================
# ==============================================================================
# - Purpose: This file contains all information relevant to interactive
#            Bash sessions to include reference calls to the .bashrc file
#
# Source Metadata
# - Author:    Jonathan A. Webb
# - Date:      April 3, 2021
# - Version:   1.0
# - Copyright: Copyright 2021, Jon Webb Inc.
# ==============================================================================
# ==============================================================================
# Begin script


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Increase the stacksize
ulimit -S -s hard
# ------------------------------------------------------------------------------


# Make vim the default editor
export EDITOR=vim
# ------------------------------------------------------------------------------


# Set the terminal color scheme
export TERM="screen-256color"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# ------------------------------------------------------------------------------
# Install Powerline-status


powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
# ------------------------------------------------------------------------------
# Install aliases

source ~/.bash_aliases
# ==============================================================================
# ==============================================================================
# eof

