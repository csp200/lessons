# Processes and Job control

## Agenda

- What is a "process"? What is a "job"?
- Process lifecycle and Process states
- Inspect basic process information
- Get system information
- Manage processes
- Manage "jobs" (shell multitasking)

## **What is a Process? What is a Job?**

### **Process**

A **process** is an instance of a program that is being executed by the
operating system. It is a fundamental concept in multitasking systems, allowing
multiple programs to run concurrently.

Each process has:

- A **Process ID (PID)**: A unique identifier assigned by the system.
- **Memory space**: Includes code, data, heap, and stack segments.
- **Execution state**: Whether it's running, waiting, stopped, etc.
- **Associated resources**: Such as open files and network connections.
- **Parent process**: The process that created it, identified by a **Parent
  Process ID (PPID)**.

**Example:** Running a simple command in the terminal, such as:

```bash
sleep 10
```

creates a new process that sleeps for 10 seconds.

---

### **Job**

A **job** is a collection of one or more processes that are managed as a unit in
a shell session. In interactive shell environments, jobs allow users to manage
multiple commands running in the foreground or background.

- A job can contain **one process** (e.g., `sleep 10`) or **multiple processes**
  (e.g., `ls | grep txt`).
- The shell assigns each job a **job ID** (different from the PID).
- Jobs can be:
  - **Foreground jobs**: Processes that interact with the terminal and block
    user input.
  - **Background jobs**: Processes that run in the background, allowing the user
    to continue working.

**Example:** Running a command in the background:

```bash
sleep 30 &
```

- The `&` at the end starts the process in the background.
- The shell outputs something like:
  ```
  [1] 12345
  ```
  Here, `[1]` is the job ID, and `12345` is the process ID (PID).

To view background jobs:

```bash
jobs
```

---

## **Process Lifecycle and Process States**

A process goes through different stages during its execution. The process
lifecycle consists of three main phases: **creation, execution, and
termination**.

### **1. Process Creation**

A new process is created in response to:

- User commands (e.g., running `ls` in the terminal).
- A system request (e.g., a web server spawning worker processes).
- Another process using **process creation system calls**.

In Unix-based systems, process creation typically follows:

1. **`fork()`** – Creates a duplicate child process.
2. **`exec()`** – Replaces the child’s memory space with a new program.
3. **`wait()`** – Allows the parent process to wait for the child to complete.

In shell scripting, most commands run as a separate process.

---

### **2. Process Execution**

Once created, the process begins execution. The CPU scheduler determines which
process gets CPU time based on factors like priority and scheduling policies.

---

### **3. Process Termination**

A process ends in several ways:

- **Normal exit**: The process completes its task and exits.
- **Error exit**: The process terminates due to an error.
- **Killed by another process**: A process can be terminated using `kill <PID>`.
- **Killed by the system**: Due to resource limits or critical errors.

---

## **Process States**

A process exists in one of several states:

| **State**    | **Description**                                                                                                     |
| ------------ | ------------------------------------------------------------------------------------------------------------------- |
| **Running**  | The process is actively executing instructions on the CPU.                                                          |
| **Sleeping** | The process is waiting for an event (e.g., I/O completion, user input).                                             |
| **Stopped**  | The process is "paused" (e.g., using `Ctrl+Z`).                                                                     |
| **Zombie**   | The process has finished execution but remains in the process table because the parent hasn’t read its exit status. |

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
