#!/usr/bin/env bash

# checking if script is running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "You should run this script as root"
    exit
fi

# checking if docker is installed
if [[ $(which docker) && $(docker --version) ]]; then
    echo "docker is installed"
  else
    echo "docker is NOT installed"
    exit
fi

echo 
echo ------------------------------------------------------
echo Adding dump data to the application. Be patient please
echo ------------------------------------------------------
echo 

docker cp ./coreBOSTests.sql mysql:/
docker container exec mysql /bin/bash -c "mysql -uroot -proot corebos80 < /coreBOSTests.sql"

echo 
echo -----------------------
echo Done successfully
echo -----------------------