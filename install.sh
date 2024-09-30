#!/bin/bash
# Loop through folders
for folder in ./*; do
  # if folder is a folder and has install.sh
  if [ -d $folder ] && [ -f $folder/install.sh ]; then
    read -p "Install $folder? (y/N) " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      bash $folder/install.sh
    fi
  fi
done
