sudo_cmd=""
if [ ! -x "$(command -v sudo)" ]; then
  sudo_cmd="sudo"
fi
$sudo_cmd apt-get update
$sudo_cmd apt-get -y install tmux

# Back up existing .tmux.conf
if [ -f "$HOME/.tmux.conf" ]; then
  cp $HOME/.tmux.conf $HOME/.tmux.conf.old
fi

# Install .tmux.conf by symlinking
cp tmux/.tmux.conf $HOME/.tmux.conf
