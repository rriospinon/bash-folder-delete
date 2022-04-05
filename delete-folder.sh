#!/bin/bash

echo "*** SCRIPT TO PERMANENT DELETE FILES UNDER THE PATH THAT IS CONTAINED IN FILE pathvul.txt"
echo "*** THE EXECUTER USER MUST HAVE THE RIGHT PRIVILIEGES OVER THE PATH"

path=$(head -n 1 ./pathvul.txt)

while true; do
    read -p "Are you sure you want to delete files inside $path ? (y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Trying to delete the folowwing files"

find $path | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"

echo "..."
echo "..."
echo "..."

rm -rf $path && echo && echo "Files deleted sucessfully"