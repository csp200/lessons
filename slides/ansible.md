---
author: Michael Lee
paging: "%d / %d"
---

# Introduction to Ansible

---

## Automation and Configuration Management: A Brief History

---

### Why Automation?

Before automation tools, system administrators *manually* configured servers,
deployed applications, and maintained infrastructure.

Leads to inefficiencies, inconsistencies, and human errors.

Automation tools simplify these tasks by enforcing repeatable, scalable, and
reliable configurations.

---

### Early Approaches to Configuration Management

**Shell Scripts**: admins wrote separate scripts to automate individual tasks

- Difficult to scale and maintain.

**Golden Images**: standardized OS images to clone machines with pre-configured
settings

- Unwieldly and lacks flexibility

---

### The Evolution of Configuration Management Tools

| Tool        | Year     | Key Features                                                                  |
| ----------- | -------- | ----------------------------------------------------------------------------- |
| CFEngine    | 1993     | Early infrastructure automation tool, focused on self-healing configurations. |
| Puppet      | 2005     | Declarative language, agent-based, used for enterprise IT automation.         |
| Chef        | 2009     | Ruby-based, infrastructure as code, agent-based.                              |
| SaltStack   | 2011     | Python-based, event-driven automation with agent and agentless modes.         |
| **Ansible** | **2012** | **Agentless, YAML-based, simple syntax, idempotent.**                         |

---

## What is Ansible?

Ansible is an open-source IT automation tool that simplifies *configuration
management*, *application deployment*, and *task automation*.

It allows users to define system configurations declaratively using YAML-based
playbooks.

---

### Key Features:

*Agentless*: No need to install software on managed nodes.

*Idempotent*: Ensures tasks produce the same result, even if run multiple times.

*Declarative Syntax*: Uses YAML for easy readability and maintainability.

*Scalable*: Works across a few machines to thousands.

*Secure*: Uses SSH for communication instead of requiring dedicated daemons.

---

## Common Use Cases for Ansible

Ansible is widely used across various IT operations for automating repetitive
tasks and ensuring consistent configurations.

1. Configuration Management
2. Application Deployment
3. Infrastructure Provisioning
4. Continuous Integration & Continuous Deployment (CI/CD)
5. Security and Compliance Enforcement
6. Orchestration of IT Environments

---

### 1. Configuration Management

- Ensuring servers have the correct software and settings.
- Managing configuration files and enforcing desired system states.
- Applying security patches and updates across multiple machines.

---

### 2. Application Deployment

- Automating software installations and updates.
- Deploying web applications, databases, and microservices.
- Rolling out application changes in a controlled manner.

---

### 3. Infrastructure Provisioning

- Setting up cloud resources on AWS, Azure, or Google Cloud.
- Managing virtual machines, containers, and Kubernetes clusters.
- Automating networking configurations (firewalls, load balancers, DNS
  settings).

---

### 4. Continuous Integration & Continuous Deployment (CI/CD)

- Automating build and deployment pipelines.
- Managing Git-based workflows (e.g., cloning repositories, running tests,
  deploying artifacts).
- Integrating with tools like Jenkins, GitHub Actions, and GitLab CI.

---

### 5. Security and Compliance Enforcement

- Automating security policies (firewall rules, user access management,
  encryption settings).
- Running security audits and remediating vulnerabilities.
- Managing secrets and credentials using Ansible Vault.

---

### 6. Orchestration of IT Environments

- Coordinating multi-machine deployments (e.g., a web server, database, and
  cache server working together).
- Scaling cloud infrastructure dynamically based on demand.
- Automating failover and disaster recovery processes.

---

## Components of an Ansible Playbook

An Ansible playbook is a structured YAML file that defines automation tasks. It
consists of several key components:

1. Plays
2. Tasks
3. Modules
4. Handlers
5. Variables
6. Inventory

---

### 1. Plays

- A play is a section of a playbook that maps a group of hosts to tasks.
- A play targets one or more managed nodes and executes defined tasks on them.

---

### 2. Tasks

- Tasks define actions to be performed on managed nodes.
- Each task calls an Ansible module to execute a specific operation.

---

### 3. Modules

- Modules are the building blocks of Ansible automation.
- Examples include `ping`, `copy`, `apt`, `yum`, `git`, and `service`.

---

### 4. Handlers

- Handlers are tasks triggered by task execution.
- Used for operations like restarting services after configuration changes.

---

### 5. Variables

- Variables store reusable values like usernames, paths, or configurations.
- Can be defined in playbooks, inventories, or separate files.

---

### 6. Inventory

- The inventory file defines the managed nodes.
- Can be static (`hosts.ini`) or dynamic (cloud-based inventories).

---

## Writing Your First Ansible Playbook

### Example: Cloning a Git Repository Over SSH

```yaml
- name: Clone a Git repository over SSH
  hosts: localhost
  tasks:
    - name: Clone the repository
      git:
        repo: "git@github.com:your-github-username/your-repository.git"
        dest: "~/projects/your-repository"
        version: "main"
        update: yes
```

### Breaking it Down:

- **`hosts: localhost`** → Runs the playbook on the local machine.
- **`tasks`** → Defines a list of automation tasks.
- **`git:`** → Calls the Ansible module for managing Git repositories.
- **`repo:`** → Specifies the SSH URL of the Git repository to clone.
- **`dest:`** → Defines the local directory where the repository will be cloned.
- **`version:`** → Specifies the branch to check out.
- **`update: yes`** → Ensures the repository is kept up to date if it already
  exists.

---

### Running the Playbook:

```bash
ansible-playbook clone_repo.yml
```

---

## 5. Managing Inventory

The **inventory file** (`hosts.ini`) defines managed nodes.

### Example: Defining Servers

```ini
[webservers]
192.168.1.10
192.168.1.11

[dbservers]
192.168.1.20
```

---

### Testing Connectivity:

```bash
ansible all -m ping -i hosts.ini
```

---

## 6. Essential Ansible Modules

| Module    | Purpose                       |
| --------- | ----------------------------- |
| `ping`    | Checks connectivity           |
| `command` | Runs shell commands           |
| `copy`    | Copies files                  |
| `file`    | Manages files and directories |
| `service` | Manages services              |
| `package` | Installs packages             |
| `user`    | Manages user accounts         |

---

### Example: Copying a File

```yaml
- name: Copy an HTML file to the web server
  hosts: webservers
  tasks:
    - name: Copy index.html
      copy:
        src: index.html
        dest: /var/www/html/index.html
```

---

## 7. Best Practices for Using Ansible

- Use **version control (Git)** for playbooks.
- Keep playbooks **modular** with **roles**.
- Use **variables** (`vars.yml`) for reusability.
- Test playbooks in a **staging environment** before production.
- Secure sensitive data using **Ansible Vault**.
