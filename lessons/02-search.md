# CSP 200 Lect 02: Search

## Agenda

- Access documentation via the manpages
- Download data from the web
- Clone a version control repository from GitHub
- View file contents in a pager
- Search for text in files
- Search for files by name

## Demo

[![asciicast](https://asciinema.org/a/699597.svg)](https://asciinema.org/a/699597)

## Summary of commands/programs

- `man`: access manual pages (documentation)
  - e.g., `man man`
- `curl`: download contents of a specified URL
  - e.g., `curl -O -L http://...`
- `less`: file pager
- `bat`: modern alternative to `less`
- `git`: tool for accessing/managing Git version control repositories
  - e.g., `git cone https://...`
- `grep`: search for text in files
  - e.g., `grep whale mobydick.txt`, `grep -r foo`
- `ag`: a faster, modern alternative to `grep`
  - e.g., `ag foo`
- `fd`: search for files by name
  - e.g., `fd prog`
- `fzf`: fuzzily search for files by name (interactivtely)
