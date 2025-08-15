# Shell basics

## Agenda

- Log in to csp200.soi2.org via SSH (secure shell)
- Get information about other users
- Navigate the hierarchical filesystem
- Create, delete, and move (rename) files and directories
- Edit text files
- Play with some other miscellaneous commands

## Demo

[![asciicast](https://asciinema.org/a/699595.svg)](https://asciinema.org/a/699595)

## Summary of commands/programs

- `ssh`: Securely connects to a remote machine over the network, enabling remote
  command-line access and file management.
  - e.g., `ssh username@csp200.soi2.org`
- `w`: Displays information about currently logged-in users and their
  activities, including load averages and uptime.
- `who`: Lists all users currently logged into the system, showing details like
  login time and terminal.
- `finger`: Provides information about system users, including their name, login
  time, and other profile details.
  - e.g., `finger username`
- `pwd`: Prints the current working directory, helping you identify your
  location in the filesystem.
- `cd`: Changes the current directory to navigate through the filesystem.
  - e.g., `cd ..`, `cd ~`, `cd /home/username`
- `ls`: Lists the contents of a directory, with options to show details like
  - e.g., `ls -l`, `ls -la`
- `tree`: Displays a graphical representation of directories and their contents
  file permissions and sizes.
  - e.g., `tree -d -L 1 /`
- `touch`: Creates an empty file or updates the timestamp of an existing file.
- `nano`: Opens a simple, user-friendly text editor directly in the terminal for
  creating or editing files.
- `cat`: Concatenates and displays the content of files, useful for quickly
  viewing text files.
- `mkdir`: Creates a new directory in the filesystem.
- `rmdir`: Removes empty directories from the filesystem.
- `cp`: Copies files
- `mv`: Moves or renames files or directories
- `rm`: Deletes files or directories, with options for recursive deletion or
  forceful removal.
- `fortune`: Displays a random, often humorous or insightful, quote or phrase.
- `cal`: Displays a calendar for the current month or a specified date range.
