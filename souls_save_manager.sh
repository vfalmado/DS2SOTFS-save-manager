#!/bin/bash
set -e

# Asking for the game

read -p "Which game are you playing?
1) Dark Souls Remastered
2) Dark Souls II: Scholar os the First Sin
" game

# Setting path variables

if [ "$game" == "1" ]; then
  SAVE_PATH=$(find "$HOME/.local/share/Steam/steamapps/compatdata/570940/pfx/drive_c/users/steamuser/Documents/NBGI/DARK SOULS REMASTERED" -name "*.sl2")
  BACKUP_PATH="$HOME/DRAKS0005.sl2"

elif [ "$game" == "2" ]; then
  SAVE_PATH=$(find "$HOME/.local/share/Steam/steamapps/compatdata/335300/pfx/drive_c/users/steamuser/Application Data/DarkSoulsII" -name "*.sl2")
  BACKUP_PATH="$HOME/DS2SOFS0000.sl2"

else
  echo "Error: Invalid option. Please enter 1 (DS1R) or 2 (DS2SOTFS)."
  exit 1
fi

# Asking for instructions

read -p "What do you want to do with your save file?
1) Backup
2) Restore
" savefile

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
