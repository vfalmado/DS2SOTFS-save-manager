#!/bin/bash
set -e

# Prompting for the game

echo "Which game are you playing?"
echo "1) Dark Souls Remastered"
echo "2) Dark Souls II: Scholar of the First Sin"
read -p "Enter your choice (1 or 2): " game

# Setting variables

case "$game" in
  1)
    SAVE_PATH=$(find "$HOME/.local/share/Steam/steamapps/compatdata/570940/pfx/drive_c/users/steamuser/Documents/NBGI/DARK SOULS REMASTERED" -name "*.sl2")
    BACKUP_PATH="$HOME/DRAKS0005.sl2"
    ;;
  2)
    SAVE_PATH=$(find "$HOME/.local/share/Steam/steamapps/compatdata/335300/pfx/drive_c/users/steamuser/Application Data/DarkSoulsII" -name "*.sl2")
    BACKUP_PATH="$HOME/DS2SOFS0000.sl2"
    ;;
  *)
    echo "Error: Invalid option. Please enter 1 or 2."
    exit 1
    ;;
esac

# Ensure save file exists

if [ -z "$SAVE_PATH" ]; then
  echo "Error: Save file not found in the expected directory."
  exit 1
fi

# Prompting for action

echo "What do you want to do with your save file?"
echo "1) Backup"
echo "2) Restore"
read -p "Enter your choice (1 or 2): " action

# Handling backup or restore

case "$action" in
  1)
    echo "You are about to backup your save file to $BACKUP_PATH"
    read -p "Do you want to proceed? (y/n): " confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
      cp "$SAVE_PATH" "$BACKUP_PATH"
      echo "Success: Save file backed up to $BACKUP_PATH"
    else
      echo "Action canceled by the user."
      exit 0
    fi
    ;;
  2)
    echo "You are about to restore your save file from $BACKUP_PATH"
    read -p "Do you want to proceed? (y/n): " confirm

    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
      if [ -f "$BACKUP_PATH" ]; then
        cp "$BACKUP_PATH" "$SAVE_PATH"
        echo "Success: Save file restored to $SAVE_PATH"
      else
        echo "Error: Backup file not found at $BACKUP_PATH"
        exit 1
      fi
    else
      echo "Action canceled by the user."
      exit 0
    fi
    ;;
  *)
    echo "Error: Invalid option. Please enter 1 (Backup) or 2 (Restore)."
    exit 1
    ;;
esac
