#!/usr/bin/env bash

USER_HOME=$HOME
INSTALL_DIR="$USER_HOME/.local/bin"

echo "Installing auto.updates..."

# 1. Copy script
mkdir -p "$INSTALL_DIR"
rm -f "$INSTALL_DIR/auto.updates"
cp auto.updates "$INSTALL_DIR/"

# Inject the current repository path so log files stay contained here
REPO_DIR="$PWD"
sed -i "s|<REPO_DIR_PLACEHOLDER>|$REPO_DIR|g" "$INSTALL_DIR/auto.updates"

chmod +x "$INSTALL_DIR/auto.updates"

# Remove any existing autostart entry if present from previous versions
AUTOSTART_FILE="$USER_HOME/.config/autostart/auto.updates.desktop"
rm -f "$AUTOSTART_FILE"

echo "Installation complete! You can now run 'auto.updates' manually from your terminal."
