# Auto Updates

A comprehensive update utility for Ubuntu/Linux systems. 

It checks `apt`, `snap`, `flatpak`, `npm`, `pip`, and `fwupdmgr` for available updates and provides an interactive CLI interface to review and install them. If you have the `agy` AI tool installed on your system, it can even automatically fetch and summarize release notes for pending updates!

## Installation

Run the installer:
```bash
./install.sh
```

This will copy the script to `~/.local/bin/` and create a GNOME Autostart entry. Whenever you log in, `auto.updates` will immediately open a terminal if there are updates available.

## Uninstallation

**⚠️ IMPORTANT: Do not just delete the folder!** 
Because this tool integrates with GNOME startup, deleting the folder will leave a "ghost" hook trying to run in the background.

To cleanly remove the script and its Autostart entry:
```bash
./uninstall.sh
```

## How it works alongside `app-reboot`

If you use this alongside the `app-reboot` project, they are completely independent but naturally coordinate. When your PC boots, `auto.updates` will launch first. `app-reboot` monitors the system's CPU load, so it will patiently wait for `auto.updates` to finish its work before it begins restoring your applications.
