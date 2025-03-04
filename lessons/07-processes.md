# Processes and Job control

## Agenda

- Understand the relationship between programs and processes
- Define the process lifecycle (creation, execution, termination) and process
  states {running, sleeping, stopped, zombie}
- Inspect basic process information (PID, PPID, state, time, command)
- Get system information
- Manage processes
- Manage "jobs" (shell multitasking)

## Demo

[![Basic process management](https://asciinema.org/a/706290.svg)](https://asciinema.org/a/706290)

[![Job management](https://asciinema.org/a/706293.svg)](https://asciinema.org/a/706293)

## Summary of commands/programs

- `ps`: Get process status information
- `top`/`htop`: Monitor process/system resource usage
- `uptime`: Get system uptime and load
- `free`: View system memory usage
- `&`: Run a program as a "background" process
- `fg`/`bg`: Run a job in the foreground / background
- `Ctrl-Z`: Stop the foreground job
- `jobs`: List current jobs managed by this shell
