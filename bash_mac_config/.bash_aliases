# .bash_aliases file
# ================================================================================ 
# ================================================================================ 
# - Purpose: This file contains all bash aliases used for creating new Bash
#            commands as well as extending or tailoring existing commands
#
# Source Metadata
# - Author:    Jonathan A. Webb
# - Date:      December 24, 2020
# - Version:   1.0
# - Copyright: Copyright 2020, Jon Webb Inc.
# ================================================================================ 
# ================================================================================
# Begin script


# Random aliases
alias calc='bc -l' # Calculator tool
# -------------------------------------------------------------------------------- 


# Tailor existing file and folder manipulation commands

# alias cp='cp iv'          # Informs user if file already exists and reports on progress
# alias mv='mv -iv          # Informs user if file already exists and reports on progress
alias mkdir_parent='mkdir -pv' # Makes a directory to include parant directories
alias cpv='rsync -ah --info=progress2'
alias mv_trash='mv --force -t ~/.local/share/Trash'
alias mkdir='mkdir -pv'  # Reports on status of mkdir and creates parent dirs if necessary
alias ll='ls -FGlAhp'    # ls command that reports on all contents
alias less='less -FSRXc' # Displays file contents
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cd2='cd ../..'     # Go back 2 directories
alias cd3='cd ../../..'  # Go back 3 directories
alias cd4='cd ../../../..' # Go back 4 directories
# Display mounted drives
alias mnt="mount | awk -F' ' '{printf \"%s\t%s\n\",\$1,\$3;}' | column -1 | egrep ^/dev/ | sort"
# - This command looks for and deletes .DS_Store files which can be used to
#   collect information on the user and report it to hackers
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias count='find . -type f | wc -l' # Count files in a directory
mkcdir() { mkdir -p -- "$1" && cd -P -- "$1"; } # Create directory then cd into it
# -------------------------------------------------------------------------------- 


# Commands to display relevant file information
alias open_='open -a Finder ./'             # Open a directory that you are currently in
alias paths='echo -e ${PATH//:/\\n}'        # Display all PATHS
alias execs='type -all'                     # Display all executables below directory
alias show_options='shopt'                  # Display all option status
alias qfind="find . -name"                 # quickly search for file
ff() { /usr/bin/find . -name "$@" ; }       # Find under the current directory
ffs() { /usr/bin/find . -name "$@"'*' ; }   # Find file whose name starts with
ffe() { /usr/bin/find . -name '*'"$@" ; }   # Find file whose name ends with

# Search for a file using MacOS Spotlight metadata
spotlight() { mdfind "kMDItemDisplayName == '$@'wc"; }
# -------------------------------------------------------------------------------- 
# Reload files 


alias reload_profile='. ~/.bash_profile'
# -------------------------------------------------------------------------------- 


# - This function compiles a LaTeX document.  Call this function by the name
#   followed by the name of the .tex file, without the .tex extension.
# - For example use the following call for the report.tex document
#   la_exec report  
latex_exec() {
        dir=`pwd`
	tex_file=$dir$'/'$1'.tex'
	dvi_file=$dir$'/'$1'.dvi'
        ps_file=$dir$'/'$1'.ps'
        pdf_file=$dir$'/'$1'.pdf'
        latex $tex_file 
	dvips $dvi_file
	ps2pdf $ps_file 
        open $pdf_file
}    
# -------------------------------------------------------------------------------- 


# Internet aliases
alias duckduckgo='open https://duckduckgo.com'
alias pandora='open https://www.pandora.com/station/play/4603528905632915968'
alias github='open https://github.com'
alias weather='open https://www.weather.gov'
alias stack_overflow='open https://stackoverflow.com'
alias photo_site='open https://www.appletonwebbphotography.com'
alias tmux_cheat='open http://tmuxcheatsheet.com'
alias vim_cheat='open https://vim.rtorr.com'
alias latex_cheat='open https://wch.github.io/latexsheet/latexsheet.pdf' 
alias bash_cheat='open https://oit.ua.edu/wp-content/uploads/2016/10/Linux_bash_cheat_sheet.pdf'
alias bash_scripting_cheat='open https://devhints.io/bash'
# -------------------------------------------------------------------------------- 


# Commands to support Network Administration
alias myip='curl ip.appspot.com'         # Displays my ip
alias netCons='lsof -i'                  # Displays open TCPIP
alias lsock='sudo /usr/sbin/lsof -i -P'  # Display open sockets

# Display useful host related information
ii() {
	echo -e "\nYou are logged on ${RED}$HOST"
	echo -e "\nAdditional information:$NC " ; uname -a
	echo -e "\n${RED}Users logged on:$NC " ; w -h
	echo -e "\n${RED}Current date :$NC " ; date
	echo -e "\n${RED}Machine stats :$NC " ; uptime
	echo -e "\n${RED}Current network location :$NC " ; scselect
	echo -e "\n${RED} Public facing IP Address :$NC " ; myip
	echo
}
# ================================================================================ 
# ================================================================================ 
# Code Development support aliases


# Python Development scripts
alias cd-python='cd $HOME/desktop/Code_Dev/Python'          # cd to Python dev folder
alias create_py_dir='~/.config/bash_scripts/create_py_dir.sh' # Create a Python project
alias create_py_file='~/.config/bash_scripts/create_py_file.sh'     # Create a Python file
alias create_py_test='~/.config/bash_scripts/create_py_test.sh'     # Create a Python test file
alias open_py_ide='~/.config/bash_scripts/pyproject_tmux.sh'  # Open a tmux based ide
alias sphinx_doc='sphinx-build -b html source build' # builds the sphinx documentation

delete_py_dir() {                                           # Delete a Python project
	echo enter directory
	read varname
	echo -n "are you sure you want to delete $varname project? [y/n]"
	read answer 
	if [ "$answer" != "${answer#[Yy]}" ] ; then
	    path=$HOME$"/desktop/Code_Dev/Python/"$varname
	    rm -r "$path"
	    echo "$path project deleted"
	else
	    echo $varname not deleted
	fi
}
# ADD DELETE PROJECT SCRIPT

# Create and activate Python virtual environments
alias ve='python3 -m venv .venv'
alias va='source .venv/bin/activate'

# -------------------------------------------------------------------------------- 
# C++ Development scirpts


alias cd-cpp='cd $HOME/desktop/Code_Dev/C++'                # cd to C++ dev folder
# ================================================================================ 
# ================================================================================
# eof
