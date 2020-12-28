#!/bin/bash

#if [ $# -lt 1 ]
#then
#    echo Usage: $0 Please provide the name of the Dockerfile as an argument to the script >&2
#    exit 1
#fi

count=0
echo "Please choose one of the following options:"
echo ""
echo "d : run 'docker-compose' to start the developer environment"
echo ""
echo "p : run 'docker-compose' to start the production environment"
echo ""
echo Any other option would exit the script
echo ""
while [ $count -lt 3 ]
  do
    read -p "Please enter your option and hit enter: " option
    echo "$option"
    if [ $option != 'd' ] && [ $option != 'p' ]
      then
        count=$((count+1))
        echo "Choose either 'd' or 'p'; script will exit after 3 attempts : attempt $count/3"
      else
        case $option in
          d) mv docker-compose.yml.dev docker-compose.yml; cp docker-compose.yml docker-compose.yml.dev; docker-compose up -d;;
          p) mv docker-compose.yml.prd docker-compose.yml; cp docker-compose.yml docker-compose.yml.prd; docker-compose up -d;;
          *) echo "Invalid Choice : Exiting...."
        esac
        exit
    fi
done
