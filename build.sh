#!/usr/bin/env bash

# checking if script is running as root 
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "You should run this script as root"
    exit
fi

# checking if git is installed
if [[ $(which git) && $(git --version) ]]; then
    echo "git is installed"
  else
    echo "git is NOT installed"
    exit
fi

# checking if zip and unzip is installed
if [[ $(which zip) && $(zip --version) ]]; then
    echo "zip is installed"
  else
    echo "zip is NOT installed"
    exit
fi

unzip db_data.zip

git clone https://github.com/tsolucio/corebos.git

chown -R www-data:www-data corebos