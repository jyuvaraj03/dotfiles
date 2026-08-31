# Exit early on non mac
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Not a mac, skipping nerd fonts install. Install manually"
  exit 0
fi

# Install JetBrainsMono through nerd fonts
brew install --cask font-jetbrains-mono-nerd-font
