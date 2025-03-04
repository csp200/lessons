# Text Wrangling

## Agenda

- Use basic text wrangling commands
- Explain and use input/output redirection and pipes
- Extract information from structured text files

## Demo

[![asciicast](https://asciinema.org/a/699846.svg)](https://asciinema.org/a/699846)

## Summary of commands/programs

- _command_ `>` _filename_: _Redirects_ the standard output of _command_ to the
  file _filename_
- _command_ `<` _filename_: _Redirects_ the standard input of _command_ from the
  file _filename_
- _command1_ `|` _command2_: Connects the standard output of _command1_ to the
  standard input of _command2_
- `tee`: Copies standard input to standard output, while making a copy in a file
- `head`: Displays the first few lines of a file (default is 10 lines), useful
  for quickly viewing the beginning of a file.
- `tail`: Displays the last few lines of a file (default is 10 lines).
- `wc`: Counts the number of lines, words, and characters in a file or input.
- `echo`: Prints text to the terminal.
- `tr`: Deletes or substitutes characters
- `cut`: Extracts specific columns or fields from a file or input based on
  delimiters and field positions.
- `sort`: Sorts lines of a file or input in ascending or descending order, with
  options for numerical or case-insensitive sorting.
- `uniq`: Filters out or displays only unique lines from sorted input, often
  used to remove duplicates.
- Ctrl-r: (reverse) search through shell command history
  - Hit enter to execute the command or right-arrow to edit before execution
  - ctrl-g to cancel the search

## Notes & Caveats

- when entering text that is being read by a command from standard input (e.g.,
  like `wc`), end the input text by hitting Ctrl-D on a line by itself (this
  sends the end-of-file character)

- remember to look up the man pages for information about all the flags used in
  the demo! (e.g., `man sort` to read about what the `-n` option does)
