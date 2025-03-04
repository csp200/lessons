# Machine problem workflow

## Agenda

- Retrieve, work on, and make submissions for the first machine problem

## Overview

We will be using [GitHub](https://github.com) and the
[Git version control system](https://git-scm.com/) to distribute and collect
machine problems in this class. A similar procedure will be used in many other
classes for programming assignments.

The [MP0 README](https://github.com/csp200/mp0/blob/main/README.md) contains a
detailed writeup of the steps we will walk you through in class.

Note that in a few weeks we will go over more advanced commands and workflows
involving Git, but for now acquainting yourself with the basics of staging,
committing, and pushing your work is sufficient to complete assigned MPs.

## Demo

[![MP workflow](https://asciinema.org/a/706495.svg)](https://asciinema.org/a/706495)

## Summary of commands/programs

- `git clone git@github.com:csp200/mpXX-username.git`: Make a local copy of the
  remote repository at the given URL.
- `git status`: Show the status of the repository (e.g., What files have
  changed? Is the repository in sync with the remote one?)
- `git add FILE`: Stage changes in FILE to be committed.
- `git commit -m "Commit message"`: Commit staged changes with the given commit
  message.
- `git push`: Push commits to the remote repository so that it is synchronized
  with the local repository.
