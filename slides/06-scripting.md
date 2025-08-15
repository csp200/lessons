# Bash scripting

## Agenda

- Overview of UNIX shells
- What is "shell scripting"?
- Programs vs. "Built-in" commands
- Bash scripting basics

## Overview of UNIX Shells

A **shell** is a command-line interface (CLI) that allows users to interact with
the operating system by executing commands, running scripts, and managing system
tasks. It acts as an intermediary between the user and the system’s _kernel_,
processing user commands and executing them accordingly.

### Common UNIX Shells

There are a ton of UNIX shells, each with their own syntax and features. The
most widely used shells include:

- **Bourne Shell (`sh`)** – One of the original UNIX shells, known for its
  simplicity and portability.
- **Bash (`bash`)** – The GNU Bourne Again Shell, an enhanced version of `sh`
  with additional scripting capabilities.
- **Korn Shell (`ksh`)** – An advanced shell with scripting improvements over
  `sh`.
- **Z Shell (`zsh`)** – Popular for its powerful customization, auto-completion,
  and plugin system.
- **Fish (`fish`)** – A modern shell designed for ease of use, with syntax
  highlighting and interactive features.

Most Linux distributions use **Bash** as the default shell, making it a
practical choice for scripting and automation.

## Introduction to Shell Scripting

### What is Shell Scripting?

A **shell script** is a sequence of commands written in a file that can be
executed as a program. Instead of typing commands one by one in the terminal,
putting them in a script allows for reuse and automation.

### Why Use Shell Scripting?

- **Automation** – Automating repetitive tasks such as backups, log file
  management, and software installation.
- **Task Scheduling** – Running tasks at scheduled intervals using tools like
  `cron`.
- **System Administration** – Managing users, monitoring system resources, and
  configuring network settings.
- **Data Processing** – Manipulating text files, parsing logs, and transforming
  data.

### How Shell Scripts Work

A shell script is executed line by line by the shell interpreter. The
interpreter processes each command just as if it were entered manually into the
terminal. Shell scripts can also incorporate logic, loops, and functions.

## Programs vs. "Built-in" Commands

In UNIX-like systems, commands executed in a shell can come from two sources:
**external programs** or **built-in shell commands**.

### External Programs

External programs are standalone binaries or scripts located in directories such
as `/bin`, `/usr/bin`, and `/usr/local/bin`. These programs are invoked when a
user types a command in the shell. Examples include:

- `ls` – Lists directory contents
- `grep` – Searches for patterns in files
- `awk` – A text-processing tool

External programs require separate execution and can be modified or replaced by
different implementations.

### Built-in Shell Commands

Built-in commands are part of the shell itself and do not require a separate
program to execute. These commands are typically faster than external programs
and provide essential shell functionalities. Examples of built-in commands
include:

- `cd` – Change the current directory
- `echo` – Print output to the terminal
- `alias` – Create command shortcuts
- `export` – Set environment variables
- `history` – Show command history

To determine whether a command is built-in or an external program, you can use
the `type` or `which` command:

```bash
$ type echo
$ which awk
```

Understanding the difference between external and built-in commands is crucial
when writing efficient shell scripts, as it can impact performance and
compatibility.

## Bash scripting basics

See [src/bash_basics.sh](../src/bash-basics.sh).

## References

- [Bash scripting cheatsheet](https://devhints.io/bash)
