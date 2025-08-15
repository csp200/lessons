# Customization

## Agenda

- Define aliases
- Customize the appearance and behavior of programs
- Change and persist program defaults using "dotfiles"
- Manage dotfiles using `stow`

## Demo

[![Basic customization](https://asciinema.org/a/706254.svg)](https://asciinema.org/a/706254)

[![Using `stow` to manage dotfiles](https://asciinema.org/a/706257.svg)](https://asciinema.org/a/706257)

## Summary of files/programs

- `alias name=value`: define an "alias" --- i.e., `name` will expand to `value`.
- `unalias name`: remove the named alias.
- `git config -l`: list Git configuration values.
- "~/.bashrc": a configuration file for the Bash shell, loaded on login.
- "~/.gitconfig": the global configuration file for Git.
- "~/.config/helix/config.toml": the configuration file for the Helix text
  editor.
- `stow`: a tool for managing symbolic links to files --- often used in
  conjunction with a centralized repository of configuration files, in order to
  install links to those files in the needed places. See `man stow` for more
  information.
