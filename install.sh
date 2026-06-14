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

# 2. Set up Autostart
AUTOSTART_DIR="$USER_HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"
AUTOSTART_FILE="$AUTOSTART_DIR/auto.updates.desktop"

# We run it via gnome-terminal so the user can interact with the CLI menu
cat <<EOF > "$AUTOSTART_FILE"
[Desktop Entry]
Type=Application
Name=Auto Updates
Comment=Checks for system updates on boot
Exec=gnome-terminal -- $INSTALL_DIR/auto.updates
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF

echo "Installation complete! auto.updates will now run automatically on boot."
