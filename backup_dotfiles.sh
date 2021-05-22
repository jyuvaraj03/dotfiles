#!/bin/bash

# check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is Available"
else
  echo "Git is not installed"
  exit 1
fi

# copy dotfiles 
# DO NOT FORGET THE DOT
cp $HOME/{.zshrc,.vimrc} .

# copy list of installed arch packages
pacman -Qqe > pkglist.txt

if [[ `git status --porcelain` ]]; then
  echo "push"
  # push to Github
  git add .;
  git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
  git push origin master
fi

exit 0
