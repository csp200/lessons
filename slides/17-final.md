---
title: "Final Lecture: Recap and Path Forward"
author: "Michael Lee <lee@iit.edu>"
---

# Agenda

- Course Topics Recap
- How to "practice"
- Suggestions topics to explore
- Closing thoughts and advice

---

# Remote workflows

- SSH (with public keys)
- Remote machine access and setup
- Terminal multiplexer (e.g., tmux) for convenience

---

# Text Wrangling & Data Processing

- `head`, `tail`, `grep`, `cut`, `sort`, `uniq`, etc.
- Composing commands with pipes
- Text-focused editing (e.g., with `helix`)

---

# Data serialization

- Structure data representation: `JSON`, `yaml`, and others
- Useful for configuration files, documentation, data transmission
- Validation and querying tools: `jq`, `yq`

---

# Command Line & Shell Scripting

- Terminal usage (`bash`)
- Shell customization and dotfiles
- Writing shell scripts
- Automating common tasks

---

# System Internals

- Processes as running programs
- Process lifecycle (Reading, Running, Blocked, Terminated)
- System monitoring (`ps`, `top`, `htop`)
- Job management (`&`, `bg`, `fg`, `kill`)

---

# Git and Version Control

- Git basics: init, add, commit, log
- Viewing differences and history
- Branches, merging, rebasing, conflict resolution
- Collaborative Git: GitHub, PRs

---

# Containers & Virtualization

- Docker images and containers
- Volumes and Bind mounting for persistence
- Customizing Dockerfiles
- Bridge networks and port mapping
- Creating/Connecting multiple containers with `compose`
- Use cases: sandboxing, reproducibility, experimentation

---

# Networking

- Networking basics
- Port-scanning (`nmap`)
- Plain-text client/server interaction (netcat/`nc`)
- Brute-force passwork cracking (takeaway: don't use plain-text passwords!)

---

# Security and Encryption

- File permissions
- Safe defaults and threat awareness
- Public key encryption (e.g., `SSH`, `GPG`)
  - Private communication
  - Signing and authentication (e.g., email, Git)
  - Hybrid encryption (symmetric+asymmetric) for efficiency

---

# Practice and Skill Maintenance

- Create a personal "lab notebook" repository
  - Your own living portfolio
    - Add configuration files, notes, experiments, scripts, etc.
  - Use branches for experiments and new ideas
- Build a Docker image with your favorite tools
  - Personalize them (e.g., via dotfiles)
  - Use it to as a playground and for personal projects!
- Teach what you know -- strongest possible reinforcement
  - Pair with a friend or tutor other students

---

# Projects to Work on

- Mini data pipelines
  - `curl` / `jq` / `csvkit`
- A small web application (maybe in `Python`/`Flask`)
  - Easy to host and run in a Docker container
- An open source application
  - Look for an interesting one on GitHub, clone it, look through issues
  - Contribute with PRs

---

# Suggested Topics to Explore

- Nix/NixOS
- Kubernetes and more DevOps
- Git workflows and GitHub actions
- Python or Rust Scripting
- Advanced System Internals (a la CS 351/450)
- Advanced Networking (CS 455)
- Security and Ethical Hacking (CS 458)

---

# The Next Decade of Tools

- Zero-Trust Architectures
  - Authentication everywhere, encrypted everything
- Ephemeral Compute Environments
  - Spin-up, do work, tear down
  - Clouds and dev platforms trend toward disposable compute
- Human-Centered Automation
  - AI copilots everywhere
  - Our roles shift to verification, architecture, and judgment
- Return of "Small Sharp Tools"
  - Evan as AI expands, minimalistic, composable tools are becoming more
    important
  - Knowing how to glue tools together remains an evergreen skill

---

# Final Advice

- *Be Curious*: Always ask how and why
- *Be Consistent*: Build daily habits with tools
- *Be Skeptical*: Understand what's under the hood
- *Be a Toolmaker*: Build the tools you need

---

# Closing Thoughts

- *Thank you!*
- You now have the language to keep learning
- Keep exploring, building, breaking, fixing
- Practical computing tools are *force multipliers*!
