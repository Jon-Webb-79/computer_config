#!/bin/bash
# ================================================================================ 
# ================================================================================ 
# Date:    January 19, 2021
# Purpose: This script will create a tmux session that is tailored for Python 
#          development.  The script will open a tmux session in a user defined
#          Python project that must be defined prior to initiation of script.

# Source Code Metadata
# Author:     Jonathan A. Webb
# Copyrights: Copyright 2020, Jon Webb Inc.
# Version:    1.0
# ================================================================================ 
# ================================================================================ 


# Set Session Name, this should be the name of a Python project
SESSION=$1

# Determine base directory to open tmux session in
path="/Desktop/Code_Dev/Python/"
file_path=$HOME$path$SESSION 
# ================================================================================ 
# Verify that the project directory exists
echo $file_path

if [ ! -d "$file_path" ]; then
    echo "FATAL ERROR: $file_path does not exist" && exit
else
    cd $file_path$"/"$SESSION
fi
# ================================================================================ 
# Develop list of open tmux sessions for comparison


SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)
# ================================================================================ 
# If tmux session does not already exist, create one and attach it


if [ "$SESSIONEXISTS" = "" ]; then
    # Start new session with Name
    tmux new-session -d -s $SESSION

# -------------------------------------------------------------------------------- 
# Configure the Main window
    
    
    # Name the first window Main
    tmux rename-window -t 1 'Main'

    # Create Three window panes
    tmux selectp -t 1
    tmux splitw -v -p 10
    tmux selectp -t 1
    tmux splitw -h -p 50
# -------------------------------------------------------------------------------- 
# Create second window for File Testing

    
    cd ../Test
    # Create second window with style matching the first 
    tmux new-window -t $SESSION:2 -n "Test"
    tmux selectp -t 1
    tmux splitw -v -p 10
    tmux selectp -t 1
    tmux splitw -h -p 50
# -------------------------------------------------------------------------------- 
# Create third window for README file 


    cd ..
    # Create second window with upper and lower window 
    tmux new-window -t $SESSION:3 -n 'README' -d 'vim README.rst'
# -------------------------------------------------------------------------------- 
# Create fourth window for Python window 


    # Create second window with upper and lower window 
    tmux new-window -t $SESSION:4 -n 'Python3' -d 'python3'
# -------------------------------------------------------------------------------- 
# Create fifth window for Python window 

   
    # Create second window with upper and lower window 
    tmux new-window -t $SESSION:5 -n 'Bash'
# ================================================================================ 
# Attach session 


    tmux attach-session -t $SESSION:1

else
    echo "tmux session already exists"
fi
