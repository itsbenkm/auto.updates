#!/usr/bin/env bash

USER_HOME=$HOME
INSTALL_DIR="$USER_HOME/.local/bin"
AUTOSTART_FILE="$USER_HOME/.config/autostart/auto.updates.desktop"

echo "Uninstalling auto.updates..."

rm -f "$INSTALL_DIR/auto.updates"
rm -f "$AUTOSTART_FILE"

echo "Uninstallation complete."
