#!/usr/bin/env bash
set -euo pipefail

# Run from the script's own directory so the relative copy and the baked-in
# project path are correct even if the installer is invoked from elsewhere.
cd "$(dirname "$(readlink -f "$0")")"

USER_HOME=$HOME
INSTALL_DIR="$USER_HOME/.local/bin"

echo "Installing auto.updates..."

# 1. Copy script
mkdir -p "$INSTALL_DIR"
rm -f "$INSTALL_DIR/auto.updates"
cp auto.updates "$INSTALL_DIR/"

# Inject the current repository path so log files stay contained here.
# Escape sed metacharacters (&, |, \) so paths containing them don't corrupt
# the substitution.
REPO_DIR="$PWD"
REPO_DIR_ESC=$(printf '%s' "$REPO_DIR" | sed -e 's/[&\\|]/\\&/g')
sed -i "s|<REPO_DIR_PLACEHOLDER>|$REPO_DIR_ESC|g" "$INSTALL_DIR/auto.updates"

chmod +x "$INSTALL_DIR/auto.updates"

# Remove any existing autostart entry if present from previous versions
AUTOSTART_FILE="$USER_HOME/.config/autostart/auto.updates.desktop"
rm -f "$AUTOSTART_FILE"

echo "Installation complete! You can now run 'auto.updates' manually from your terminal."
