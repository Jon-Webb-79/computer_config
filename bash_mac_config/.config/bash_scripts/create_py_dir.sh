#!/bin/bash

# create_py_dir.sh

# Prompt user for projects name
echo Enter Project Name:
read varname

# Develop directory path
path="/Desktop/Code_Dev/Python/"
file_path=$HOME$path$varname

py_path=$HOME$"/.config/py_files"
bash_path=$HOME$"/.config/bash_scripts"

# Verify project name does not already exist
if [ -d "$file_path" ]; then
    echo "FATAL ERROR: $file_path already exists"
else
    # If directory does not exist, create project
    mkdir "$file_path"
    cd "$file_path"
    mkdir .venv
    mkdir src
    mkdir scripts
    mkdir scripts/bash
    mkdir test
    mkdir data
    mkdir docs
    mkdir docs/sphinx
    mkdir docs/requirements
    cp $py_path$"/__init__.py" src/__init__.py
    cp $py_path$"/LICENSE" LICENSE
    cp $py_path$"/README.rst" README.rst
    cp $py_path$"/.gitignore" .gitignore
    touch requirements.txt
    cp $py_path$"/setup.py" setup.py
    cp $py_path$"/main.py" src/main.py
    cp $py_path$"/test.py" test/test.py
    mkdir docs/sphinx/build
    mkdir docs/sphinx/source
    cp $py_path$"/sphinx_make" docs/sphinx/Makefile
    cp $py_path$"/conf.py" docs/sphinx/source/conf.py
    cp $py_path$"/index.rst" docs/sphinx/source/index.rst
    cp $py_path$"/Introduction.rst" docs/sphinx/source/Introduction.rst
    cp $py_path$"/sphinx_readme.txt" docs/sphinx/readme.txt
    cp $bash_path$"/run_tests.sh" scripts/bash/run_tests.sh
    cp $bash_path$"/unit_tests.sh" scripts/bash/unit_tests.sh
    mkdir data/test
    tmux_path=$HOME$"/.config/bash_scripts/pyproject_tmux.sh" 
    bash $tmux_path $varname
    echo Project $varname created
fi
# eof
