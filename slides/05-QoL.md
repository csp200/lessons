---
title: "Some quality of life items"
author: "Michael Lee"
---

# Some quality of life items

## Agenda

- Multitasking
- Terminal multiplexing
- Editor color support/themes
- Shell history and navigation
- Shell personalization

---

# Multitasking

- Shell support for multitasking:
  - `Ctrl-Z` to "stop" (pause execution)
  - `jobs` to list jobs
  - `fg %N` to "foreground" job `N`
  - `kill %N` to "kill" job

---

# Terminal multiplexing

- `tmux` to start a terminal multiplexing session
  - By default: `Ctrl-b` is the "prefix key" followed by a command:
    - `?` for a listing of commands
    - `c` create a new window
    - `n`/`p` to go to next/prior window
    - `"` split a window vertically (into panes)
    - `%` split a window horizontally
    - `o` to switch between panes
    - `d` to "detach"
- On subsequent login: `tmux at` to attach to running session

---

## Configuring `tmux`

- Edit "~/.tmux.conf" to add new keybindings and settings
  - Check out my "tmux.conf" (in "/tmp/tmux.conf") for ideas!

---

# Editor color support/themes

- In Helix, `:config-reload` to edit configuration file
  - Located in "~/.config/helix/config.toml"

  - Add the following, then save and quit:

```toml
[editor]
true-color = true
```

- Next, do `:theme` followed by space, then hit TAB to cycle through themes. Add
  following to config file to make permanent:

```toml
theme = "theme_name"
```

---

# Shell history and navigation

- Use `Ctrl-r` at shell to do a history search (enter to execute)
- `!!` to execute most recent command
- `!string` to execute most recent command starting with `string`
- `^s1^s2` to execute most recent command, replacing `s1` replaced by `s2`
- `cd -` to jump back to previous directory

---

# Shell personalization

- `PS1` shell variable controls the shell prompt string
  - e.g., try `PS1='>'`
  - Don't panic! Do `source ~/.bashrc` to restore
  - Some special "escape sequences":
    - \u → username
    - \h → hostname (short)
    - \H → full hostname
    - \w → current working directory
    - \W → basename of current directory
    - \t → current time (HH:MM:SS)
  - Edit "~/.bashrc" to make changes permanent!
    - E.g., `PS1="\h:\W\$ "`
- Can define "aliases" to create shortcuts for favorite commands:
  - `alias shortcut='actual command'`
    - e.g., `alias ll='ls -lh'`, or `alias gs='git status'`
  - Add to "~/.bashrc" to make permanent!
