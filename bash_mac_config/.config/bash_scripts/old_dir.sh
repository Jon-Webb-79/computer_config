#!/bin/bash 
if [ $# -eq 0 ]
then       	
    echo 'User Must Enter the Directory Name as a Command Line Argument'
    exit 0    
fi    
mkdir "$1"
mkdir "$1"/src "$1"/test "$1"/data "$1"/scripts "$1"/venv
touch "$1"/__init__.py
touch "$1"/src/__init__.py "$1"/src/main.py
touch "$1"/test/__init__.py
exit 0
