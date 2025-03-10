#!/bin/sh

set -e

# Define directories
CONFIG_DIR="${HOME}/.config"
DOTFILES_DIR="${CONFIG_DIR}/dotfiles"
NIX_DIR="${CONFIG_DIR}/nix"
SCRIPTS_DIR="${DOTFILES_DIR}/scripts"

BASE_URL="https://raw.githubusercontent.com/halqme/.config/main"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if nix is installed
if ! command_exists nix; then
    echo "Error: Nix is not installed. Please install Nix first."
    exit 1
fi

# Clone dotconfig repository
if [ -d "${CONFIG_DIR}" ]; then
    echo "Dotfiles directory already exists, updating from repository..."
    mv "${CONFIG_DIR}" "${CONFIG_DIR}.bak"
else
    echo "Setting up dotfiles for the first time..."
fi
nix --extra-experimental-features "nix-command flakes" run nixpkgs#git clone https://github.com/halqme/.config
if [ ! -f "${CONFIG_DIR}" ]; then
    echo "Clone Failed"
    exit 1
fi
chmod +x "${SCRIPTS_DIR}/install.sh"

# Apply nix configuration
echo "Deploying Nix configuration..."
if [ -f "${NIX_DIR}/flake.nix" ]; then
    cd "${NIX_DIR}"
    nix profile install ~/.config/nix#orb-nix
    echo "Nix configuration successfully deployed!"
else
    echo "Error: flake.nix not found in ${NIX_DIR}"
    exit 1
fi

echo "Installation completed successfully!"
