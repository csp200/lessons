---
title: "Shell scripting"
author: "Michael Lee"
---

# Shell scripting

## Agenda

- Overview of UNIX shells
- Introduction to Shell Scripting
- Bash Scripting Demo/Tutorial

---

# Overview of UNIX Shells

A **shell** is a command-line interface (CLI) that allows users to interact with
the operating system by executing commands, running scripts, and managing system
tasks.

It acts as an intermediary between the user and the system’s *kernel*,
processing user commands and executing them accordingly.

---

# Overview of UNIX Shells

## Common UNIX Shells

There are a ton of UNIX shells, each with their own syntax and features. The
most widely used shells include:

- **Bourne Shell (`sh`)** – One of the original UNIX shells, known for its
  simplicity and portability.
- **Bash (`bash`)** – The GNU Bourne Again Shell, an enhanced version of `sh`
  with additional scripting capabilities.
- **Z Shell (`zsh`)** – Popular for its powerful customization, auto-completion,
  and plugin system.
- **Fish (`fish`)** – A modern shell designed for ease of use, with syntax
  highlighting and interactive features.

Most Linux distributions use **Bash** as the default shell, making it a
practical choice for scripting and automation.

---

# Introduction to Shell Scripting

## Why Use Shell Scripts?

- **Automation** – Automating repetitive tasks such as backups, log file
  management, and software installation.
- **Task Scheduling** – Running tasks at scheduled intervals using tools like
  `cron`.
- **System Administration** – Managing users, monitoring system resources, and
  configuring network settings.
- **Data Processing** – Manipulating text files, parsing logs, and transforming
  data.

---

# Introduction to Shell Scripting

## How Shell Scripts Work

A shell script is executed line by line by the shell interpreter. The
interpreter processes each command just as if it were entered manually into the
terminal.

Shell scripts can also incorporate logic, loops, and functions.

---

# Introduction to Shell Scripting

## Our First Script

E.g., place the following in a file named "script.sh":

```bash
echo "Hello from my first script!"
```

Run it with the command `bash script.sh`

---

# Introduction to Shell Scripting

## Making shell scripts "executable"

So we don't have to always type `bash SCRIPTNAME`, we can add a "shebang" line
to the top of a script:

```bash
#! /bin/bash 

echo "Hello from my first script!"
```

Then we have to make the file *executable* with the command:

```bash
chmod +x script.sh
```

And finally we can just run the script with the command `./script.sh`

- the "./" part says to look for the executable in the current directory (for
  security reasons, the current directory isn't search for executables)

---

# Introduction to Shell Scripting

## Programs vs. "Built-in" Commands

Commands executed in a shell can come from two sources: **external programs** or
**built-in shell commands**.

- Examples of external programs commonly used in shell scripts are `ls`, `grep`,
  `cut`, etc.

- Examples of built-in commands commonly used are `cd`, `echo`, `printf`,
  `export`.

Confusingly, some shells replace certain external programs with their own
builtins, and some common builtins are also implemented as external programs.

- You can use the `type` and `which` commands to help determine whether a given
  command is an external command or a builtin

---

# Bash Scripting Demo/Tutorial

During a live demo, we'll take a look at some of the most common shell-scripting
techniques, including:

- variable assignment and interpolation
- command substitution
- arithmetic
- input
- conditional expressions and tests
- filename expansions
- looping
- accessing command-line arguments
- defining functions

See [src/bash_basics.sh](../src/bash-basics.sh) for the full source.

Here's a handy [Bash scripting cheatsheet](https://devhints.io/bash)
