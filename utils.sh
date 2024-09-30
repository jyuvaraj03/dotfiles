# Function to check if sudo exists and echo "sudo" if sudo exists
function get_sudo_cmd() {
  if [ -x "$(command -v sudo)" ]; then
    echo "sudo"
  fi
}

# Loop through
