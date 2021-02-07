#!/bin/bash

# create_py_file.sh

# Prompt user for file name
echo Enter file name without .py extension
read varname

# Develop directory path
py_path=$HOME$"/.config/py_files"

dir=`pwd`
file_name=$dir$"/"$varname$".py"

# Create file if it does not aleady exist
if [ -f "$file_name" ]; then
    echo "FATAL ERROR: $file_name already exists"
else
    cp $py_path$"/main.py" $file_name  
    echo $file_name created
fi
