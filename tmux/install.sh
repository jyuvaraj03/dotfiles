source utils.sh
sudo_cmd=get_sudo_cmd
$sudo_cmd apt-get update
$sudo_cmd apt-get -y install tmux

# Loop through normal users and install config
for user in $(ls /home); do
  # Back up existing .tmux.conf
  if [ -f "/home/$user/.tmux.conf" ]; then
    mv /home/$user/.tmux.conf /home/$user/.tmux.conf.old
  fi
done

# Install .tmux.conf by symlinking
ln -s $(pwd)/tmux/.tmux.conf /home/$user/.tmux.conf
cp tmux/.tmux.conf /home/$user/.tmux.conf
