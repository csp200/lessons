---
title: "The Process"
author: "Michael Lee"
---

# The "Process"

## Agenda

- What is a "Process"?
- Process lifecycle
- Process states
- "Jobs"
- Getting process/system information
- Process management

---

# What is a Process?

**Process** is *program in execution*.

I.e., it is an instance of a program, being run and tracked by the operating
system (and, possibly, the shell).

---

## Process information

The OS tracks the following for each process:

- **Process ID (PID)**: A unique identifier assigned by the system.
- **Memory space**: Includes code, data, heap, and stack segments.
- **Execution state**: Whether it's running, waiting, stopped, etc.
- **Associated resources**: Such as open files and network connections.
- **Parent process**: The process that created it, identified by a **Parent
  Process ID (PPID)**.

---

# Process Lifecycle

A process goes through different stages during its execution.

The process lifecycle consists of three main phases: **creation, execution, and
termination**.

---

## 1. Process Creation

A new process is created in response to:

- User commands (e.g., running `ls` in the terminal).
- A system request (e.g., a web server spawning worker processes).
- Another process using **process creation system calls**.

From the perspective of a shell, all external commands (i.e., not built-ins),
run as a separate process.

---

## 2. Process Execution

Once created, the process begins execution. The *operating system scheduler*
determines which process gets CPU time based on factors like priority and
scheduling policies.

---

## 3. Process Termination

A process ends in several ways:

- **Normal exit**: The process completes its task and exits.
- **Error exit**: The process terminates due to an error.
- **Killed by another process**: A process can be terminated using `kill <PID>`.
- **Killed by the system**: Due to resource limits or critical errors.

---

## Process States

After a process is created, a process is in one of the following states:

| **State**    | **Description**                              |
| ------------ | -------------------------------------------- |
| **Running**  | Actively executing instructions on the CPU   |
| **Sleeping** | Waiting for an event (e.g., user input)      |
| **Stopped**  | "Paused" (e.g., using `Ctrl+Z`)              |
| **Zombie**   | Terminated but its exit status is held by OS |

After a process turns into a **Zombie**, and it is "reaped" (by either the OS or
its parent process), the process effectively disappears from the system.

---

## Running vs. "Ready"/"Runnable"

The number of running processes is physically limited by the number of CPU cores

- Processes which are in the running state, but not actually executing are
  termed "ready"/"runnable"

  - OS scheduler maintains a queue of runnable processes to switch on/off CPUs

---

# "Jobs"

When you start a process from the shell (e.g., by typing a command), the shell
tracks that process (and, potentially, others related to it) as a "job".

- A job can contain **one process** (e.g., `sleep 10`) or **multiple processes**
  (e.g., `ls | grep txt`).
- The shell assigns each job a **job ID** (different from the PID).
- Jobs can be:
  - **Foreground jobs**: Processes that interact with the terminal and block
    user input.
  - **Background jobs**: Processes that run in the background, allowing the user
    to continue working.

---

## Job management

We previously discussed shell job management features:

- `Ctrl-Z` to stop a job
- `jobs` to list jobs managed by the current shell
- `fg %JID` to run job with id JID in the foreground
- `bg %JID` to run job with id JID in the background
- `COMMAND &` to start COMMAND as a background job

---

# Getting process information

There are many Unix commands to get process-related information:

- `ps`: Get process status information
- `pstree`: Show processes in a hierarchical tree.
- `top`/`htop`: Monitor process/system resource usage
- `uptime`: Get system uptime and load
- `free`: View system memory usage

---

## An essential statistic: "load average"

- Def. average number of runnable processes over some period of time
- Only meaningful in contrast to the number of CPU cores
  - E.g., # customers waiting in a store vs. # cashiers
