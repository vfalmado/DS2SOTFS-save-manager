# Soulsborne Save Manager

This script is a straightforward tool designed to manage your  *Darks Souls Remastered * and *Dark Souls II: Scholar of the First Sin* save files on Linux. It simplifies the process of backing up and restoring your progress, helping you protect your gameplay and recover saves when needed.

## Features
- **Backup Save File:** Easily create a backup of your current save file.
- **Restore Save File:** Restore your progress from a previously backed-up file.
- **Automatic Save File Detection:** The script automatically locates your save file in the standard Steam Proton directory.
- **Backup Location:** Your save file is backed up in your home directory.
  
## Prerequisites
- Operating System: A Linux-based system.
- Steam Installation: Steam must be installed (non-Flatpak version).
- Game Installation: the game must be installed on your system.
- Save File Generation: Launch the game and create at least one character to generate the save file.
- Save File Location: Save files must be in the standard Steam Proton directory

## Installation
1. Download the script file.
2. Make the script executable:
   ```bash
   chmod +x souls_save_manager.sh
   ```

## Usage
1. Open a terminal.
2. Run the script:
   ```bash
   ./souls_save_manager.sh
   ```
3. Follow the on-screen prompts to choose the installed game:
   - Enter `1` for *Dark Souls Remastered*
   - Enter `2` for *Dark Souls 2: Scholar of the First Sin*
5. Follow the on-screen prompts to either back up or restore your save file:
   - Enter `1` to back up the save file
   - Enter `2` to restore a previously backed-up file

## Warning
This script will overwrite your current save file with the backup stored in your home directory. Use it with caution and always verify your actions before proceeding.

# Future improvements
- Save file renaming: add a feature to rename save files for better organization.
- Confirmation step: implement a confirmation prompt before overwriting or restoring save files to prevent accidental actions.
