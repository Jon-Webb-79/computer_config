# .bashrc filie
# ================================================================================ 
# ================================================================================ 
# - Purpose: This file contains all information relevant to interactive
#            Bash sessions to include refernce cals to the .bashrc file
#
# Source Metadata
# - Author:    Jonathan A. Webb
# - Date:      December 24, 2020
# - Version:   1.0
# - Copyright: Copyright 2020, Jon Webb Inc.
# ================================================================================ 
# ================================================================================
# Begin script


# Increase the stacksize 
ulimit -S -s hard
# Networking
# -------------------------------------------------------------------------------- 


# Make VIM the defalt editor
export EDITOR=vim
# -------------------------------------------------------------------------------- 


# Set the Terminal color scheme

export TERM="screen-256color"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# -------------------------------------------------------------------------------- 
# Install Powerline-status


powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/Python3.9/site-packages/powerline/bindings/bash/powerline.sh
# -------------------------------------------------------------------------------- 
# Install aliases


source ~/.bash_aliases
# ================================================================================ 
# ================================================================================
# eof
