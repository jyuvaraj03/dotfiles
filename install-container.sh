#!/bin/bash
# Loop through folders
folders=("tmux" "yuvim" "lazygit" "tmuxinator")
for folder in ${folders[@]}; do
  # if folder is a folder and has install.sh
  if [ -d $folder ] && [ -f $folder/install.sh ]; then
    bash $folder/install.sh
  fi
done
