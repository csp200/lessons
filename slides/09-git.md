# Git

## Agenda

- Create and manage Git repositories
- Work with commits and branches
- Understand and resolve merge conflicts
- Undertand the difference between fast-forward, squash merges, and rebasing
- Create, vet, and merge pull requests
- Use GitHub issues to track, assign, and manage projects

## Demo

[![Branching, Merging, and Rebasing](https://asciinema.org/a/706067.svg)](https://asciinema.org/a/706067)

[![Merging and Rebasing with Remotes](https://asciinema.org/a/706068.svg)](https://asciinema.org/a/706068)

## Summary of commands/programs

- `git init .`: Creates a Git repository in the current directory.
- `git add FILE ...`: Stages `FILE` (adds it to the index), preparing it for
  commit.
- `git commit`: Creates a new commit with staged changes, opening the default
  editor for the commit message.
- `git commit -a`: Stages all modified and deleted files (excluding untracked
  files) and commits them in one step.
- `git commit -m "Commit message"`: Creates a new commit with staged changes,
  using the provided message.
- `git remote add REMOTE_NAME URL`: Adds a remote repository with the specified
  name and URL.
- `git push -u REMOTE_NAME BRANCH`: Pushes the local BRANCH to REMOTE_NAME and
  sets it as the upstream branch.
  - An _upstream branch_ is the remote branch that your local branch is
    tracking. Setting an upstream branch tells Git where to fetch updates from
    and where to push changes by default
- `git pull`: Fetches updates from the upstream branch and merges them into the
  current branch.
- `git branch`: Lists all local branches.
- `git branch -d BRANCH`: Deletes the specified local branch if it has been
  fully merged.
- `git switch BRANCH`: Switches to the specified branch.
- `git switch -c BRANCH`: Creates a new branch and switches to it.
- `git merge BRANCH`: Merges changes from the specified branch into the current
  branch.
- `git rebase BRANCH`: Moves the current branch’s commits on top of the
  specified branch, rewriting history for a cleaner commit structure.
