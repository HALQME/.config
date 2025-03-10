#!/bin/bash

set -e

# Define directories
CONFIG_DIR="${HOME}/.config"
DOTFILES_DIR="${CONFIG_DIR}/dotfiles"
NIX_DIR="${CONFIG_DIR}/nix"
SCRIPTS_DIR="${DOTFILES_DIR}/scripts"

# Create necessary directories
mkdir -p "${NIX_DIR}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if nix is installed
if ! command_exists nix; then
    echo "Error: Nix is not installed. Please install Nix first."
    exit 1
fi

# Clone or update dotconfig repository
if [ -d "${DOTFILES_DIR}" ]; then
    echo "Dotfiles directory already exists, updating from repository..."
    # Since git is not available, we'll download the latest files
    mkdir -p "${DOTFILES_DIR}/temp"
    curl -s https://raw.githubusercontent.com/halqme/nix-config/main/.config/dotfiles/scripts/install.sh -o "${SCRIPTS_DIR}/install.sh"
    curl -s https://raw.githubusercontent.com/halqme/nix-config/main/.config/nix/flake.nix -o "${NIX_DIR}/flake.nix"
    chmod +x "${SCRIPTS_DIR}/install.sh"
else
    echo "Setting up dotfiles for the first time..."
    mkdir -p "${DOTFILES_DIR}/scripts"
    curl -s https://raw.githubusercontent.com/halqme/nix-config/main/.config/dotfiles/scripts/install.sh -o "${SCRIPTS_DIR}/install.sh"
    curl -s https://raw.githubusercontent.com/halqme/nix-config/main/.config/nix/flake.nix -o "${NIX_DIR}/flake.nix"
    chmod +x "${SCRIPTS_DIR}/install.sh"
fi

# Apply nix configuration
echo "Deploying Nix configuration..."
if [ -f "${NIX_DIR}/flake.nix" ]; then
    cd "${NIX_DIR}"
    # Enable flakes if not already enabled
    if ! nix show-config | grep 'experimental-features.*flakes' >/dev/null; then
        mkdir -p ~/.config/nix
        echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf
    fi

    # Apply the configuration
    nix --extra-experimental-features "nix-command flakes" run nixpkgs#home-manager -- switch --flake .
    echo "Nix configuration successfully deployed!"
else
    echo "Error: flake.nix not found in ${NIX_DIR}"
    exit 1
fi

echo "Installation completed successfully!"
