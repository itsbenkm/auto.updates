# Auto Updates

A comprehensive update utility for Ubuntu/Linux systems. 

It checks `apt`, `snap`, `flatpak`, `npm`, `pip`, and `fwupdmgr` for available updates and provides an interactive CLI interface to review and install them. If you have the `agy` AI tool installed on your system, it can even automatically fetch and summarize release notes for pending updates!

## Installation

Run the installer:
```bash
./install.sh
```

This will copy the script to `~/.local/bin/`. You can then run `auto.updates` manually from your terminal at any time.

## Moving or Relocating the Folder

The installer records **this folder's location** so the tool knows where to keep your update history. If you move or rename the folder later, just **re-run `./install.sh`** from the new location.

If the folder goes missing, `auto.updates` still works — it simply warns that history won't be saved until you re-install from the new location.

## Uninstallation

To cleanly remove the script:
```bash
./uninstall.sh
```
## Changelog

**Latest Updates:**
- **Smarter Update History:** Refactored the `update_history.log` file formatting to logically group updates by day without repeating the date header. The log now also pulls the AI-generated explanations from the cache, matching the output shown in the interactive UI.
- **Strict Error Handling:** Modified the installation sequence to accurately capture the exit status of package managers. Failed installations (like unsupported Node.js engines during NPM updates) will print a warning and will be skipped in the update history log, ensuring the log always perfectly reflects your system state.
