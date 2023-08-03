# Kindle .sdr folder Clean-up Script

The bash script is to remove unnecessary `.sdr` folders in a Kindle documents path. It is based on the concept of [sdr-Cleaner](https://bookfere.com/post/43.html) by @bookfere [https://github.com/bookfere](https://github.com/bookfere).

## Usage

### Linux/macOS

1. Open a terminal.
2. Navigate to the directory where the script is located.
3. Run the script by executing the following command:
   ```bash
   $ ./kindle-cleanup.sh
   ```
4. The script will prompt you to enter the path to your Kindle documents path. You can do this by either typing the path manually or by dragging and dropping the folder into the terminal. If you choose to drag and drop, simply locate the folder in your file explorer, click and hold it, and then drag it into the terminal window. The path will be automatically entered for you.
5. Press Enter to start the cleaning process.

### Windows

1. Open PowerShell.
2. Navigate to the directory where the script is located.
3. Run the script by executing the following command:
   ```powershell
   PS> ./kindle-cleanup.sh
   ```
4. The script will prompt you to enter the path to your Kindle documents path. You can do this by either typing the path manually or by dragging and dropping the folder into the terminal. If you choose to drag and drop, simply locate the folder in your file explorer, click and hold it, and then drag it into the terminal window. The path will be automatically entered for you.
5. Press Enter to start the cleaning process. 

The script will analyze the files and folders in the provided path and detect any extra `.sdr` folders that do not have a corresponding book file.

If any unnecessary folders are found, the script will prompt you to delete them and save the details to a file named `removed_folders.txt`.

## Functionality

The script performs the following tasks:

- Finds all files and folders in the top level of the given path.
- Compares file names to directory names.
- Identifies any `.sdr` folders without a matching book file as useless.
- Prompts you to delete the useless folders and records the details in `removed_folders.txt`.
- Ignores dotfiles and dotfolders while scanning.

## Requirements

To run this script, you need the following dependencies:

- Bash (already available on Linux/macOS by default)
- `find` command
- `cut` command
- `sort` command
- `comm` command

These dependencies are typically included with the operating system, so you may not need to install anything additional. However, it's always a good idea to double-check and ensure that these commands are available on your system before running the script.
