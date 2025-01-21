#!/bin/bash
set -e

# Asking for instructions

read -p "What do you want to do with your save file?
1) Backup
2) Restore
" savefile

# Setting path variables

SAVE_PATH=$(find "$HOME/.local/share/Steam/steamapps/compatdata/335300/pfx/drive_c/users/steamuser/Application Data/DarkSoulsII" -name "*.sl2")
BACKUP_PATH="$HOME/DS2SOFS0000.sl2"

# Handling the file

if [ "$savefile" == "1" ]; then
  if [ -f "$SAVE_PATH" ]; then
    cp "$SAVE_PATH" "$BACKUP_PATH"
    echo "Success: Save file successfully backed up to $BACKUP_PATH"
  else
    echo "Error: Save file not found at $SAVE_PATH"
    exit 1
  fi

elif [ "$savefile" == "2" ]; then
  if [ -f "$BACKUP_PATH" ]; then
    cp "$BACKUP_PATH" "$SAVE_PATH"
    echo "Success: Save file successfully restored to $SAVE_PATH"
  else
    echo "Error: Backup file not found at $BACKUP_PATH"
    exit 1
  fi

else
  echo "Error: Invalid option. Please enter 1 (Backup) or 2 (Restore)."
  exit 1
fi
