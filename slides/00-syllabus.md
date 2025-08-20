---
title: "Syllabus and Overview"
author: "Michael Lee"
---

<!-- list_item_newlines: 2 -->

# Syllabus and Overview

## Agenda

- Staff
- Course Overview
- Topics and Tools
- Administrivia

---

## Staff

- Prof: Michael Lee
  - Email: *lee@iit.edu*
  - Office hours: Tue/Thu 11:30AM-1:30PM
    - All office hours are virtual!

---

## Course Overview

- Hands-on introduction to practical tools, platforms, and workflows commonly
  used in both classroom and industry

  - Typically shoehorned into unrelated courses

<!-- pause -->

- Goals:

  - Reduce burden on other courses
  - Dedicate sufficient time to focus on and use them
  - Curate resources for self-study

---

## Topics and Tools

- Command line interfaces (CLIs)
- Text manipulation
- Scripting and automation
- Development tools and processes
- Software configuration management (SCM)
- Containers and VMs
- Information security
- Web and Cloud tools
- AI tools / LLMs

---

### Command Line Interfaces (CLIs)

- Text-based interface for interacting with the computer — the OG UI!
- Allows users to efficiently execute commands, automate tasks, and manage files
- Significant in system administration, development, and troubleshooting

---

#### CLI Tools

- `bash`: Popular shell for Unix/Linux systems
- `PowerShell`: Command-line interface for Windows systems
- `zsh`, `fish`, etc.: Popular alternative shells
- `tmux`, `zellij`: *screen multiplexing* tools

---

#### e.g., hello from the command line

```bash +exec
echo "hello from the command line!" | cowsay
```

---

### Text Manipulation

- Modifying, analyzing, and extracting information from text files
- Crucial for processing logs, data files, and configuration files

---

#### Text Manipulation Tools

- `grep`: pattern search
- `sed`/`awk`: stream editors
- `cut`, `sort`, `uniq`, etc.: filtering and organizing text
- `ag`, `fd`, `zf`: advanced search tools
- `helix`: powerful, modal text editor

---

#### e.g., basic text manipulation

```bash +exec
head -3 ../data/romeo.txt
```

<!-- pause -->

```bash +exec
cat ../data/romeo.txt | tr -cs '[:alpha:]' '\n' \
  | sort | uniq -c | sort -nr | head -5
```

---

### Scripting and Automation

- Writing scripts to automate repetitive tasks and streamline workflows
- Enhances productivity and reduces human error

---

#### Scription and Automation Tools

- `bash`/`bashdb`: scripting language and tools
- `make`, `ant`: command line build tools
- `Python`: general-purpose scripting and automation language
- `cron`: task scheduler for Unix/Linux systems

---

#### e.g., a simple Text processing script

```bash +exec
FILENAME="../data/romeo.txt"

WORDS=$(grep -oE '[[:alpha:]]+' $FILENAME \
        | tr '[:upper:]' '[:lower:]')

echo "Total words: $(echo "$WORDS" | wc -w)"

echo "Unique words: $(echo "$WORDS" | sort -u | wc -l)"

LONGEST=$(echo "$WORDS" | awk '{print length, $0}' \
          | sort -nr | head -1 | cut -d' ' -f2)
LEN=$(echo "$LONGEST" | awk '{print length}')
echo 
echo "Longest word(s) (length $LEN):"
echo "$WORDS" | awk -v len="$LEN" 'length($0) == len'
```

---

### Development

- Tools and practices that streamline software development and collaboration
- Essential for version control, debugging, and team workflows

---

#### Development Tools

- `gdb`, `objdump`, `valgrind`, `strace`: debuggers / tracers
- REPLs: interactive coding and evaluation environment (DEMO)
- VSCode: integrated development environment
- Jupyter Notebooks: browser based coding environment

---

#### e.g., binary executable object dump

```bash +exec
objdump -d /bin/ls | head -10
```

---

### Software Configuration Management (SCM)

- Managing changes in software to maintain integrity and traceability
- Automates the deployment and configuration of systems

---

#### SCM Tools

- Git: distributed version control system
- Apt: advanced packaging tool for managing Linux packages
- Ansible: Python-based tool for automates provisioning, deployment, and other
  software processes
- Kubernetes (k8s): automates processes such as deploying, scaling, and managing
  applications in containers

---

#### e.g., Git log

```bash +exec
git log -n 3
```

---

### Containers and VMs

- Running multiple operating systems or applications on a single machine.
- Improves resource utilization and simplifies testing/deployment.

---

#### Container and VM Tools

- Docker: container platform for virtual machines or applications
- VirtualBox: cross-platform virtualization software
- AWS EC2: cloud-based virtual machines

---

#### e.g., Hello from a container

```bash +exec
docker run --rm --pull=always alpine \
       echo "Hello from Linux!"
```

---

### Information Security

- Protecting systems and data from unauthorized access, threats, and
  vulnerabilities.
- Critical in safeguarding sensitive information.

---

#### Information Security Tools

- `nmap`: network exploration tool / port scanner
- SSH: Secure remote access to servers
- `shaXXXsum`: secure hashing functions
- OpenSSL: Cryptography and security protocols
- Wireshark: Network protocol analyzer

---

#### e.g., local port scan

```bash +exec
nmap -F localhost
```

---

### Web and Cloud

- Tools for developing, deploying, and managing applications on the web and in
  the cloud
- Essential for scalable and distributed systems

---

#### Web and Cloud Tools

- `ncat`, `curl`, `telnet`: command-line networking tools
- `rsync`: remote file synchronization tool
- AWS: Cloud computing platform.
- RESTful APIs

---

#### e.g., REST API

```bash +exec
curl -s https://official-joke-api.appspot.com/random_joke
```

<!-- pause -->

```bash +exec
curl -s https://official-joke-api.appspot.com/random_joke \
   | jq -r '"\(.setup) — \(.punchline)"'
```

---

### AI

- Tools that leverage artificial intelligence to enhance productivity and
  decision-making.
- Transformative for automation, data analysis, and software development.

---

#### AI Tools

- ChatGPT: AI-powered conversational assistant
- Copilot: AI for writing code
- TensorFlow/PyTorch: Frameworks for machine learning

---

<!-- jump_to_middle -->

## Administrivia

---

### Grade Breakdown

- In-class Surveys: 20%
- Quizzes: 30%
- Machine Problems (MPs): 50%

---

#### In-Class Surveys

- Most lectures will include live, in-class surveys to help assess progress
  - 100% for participating (proxy for mandatory attendance!)
- First two missed surveys are dropped, 0 for each missed survey thereafter
- Surveys are all equally weighted

---

#### Quizzes

- Sets of objective questions (mostly concept-focused) on Canvas
  - Help you assess your own understanding
  - You may take them an unlimited number of times before due date
  - Highest score earned is counted
- ~8 quizzes total; weighted equally

---

#### Machine Problems (MPs)

- Practical/Coding assignments
- We provide high-level specifications and (sometimes) base code for your
  implementation
- Some may require collaboration
- Submissions via version control (Git)

---

### Late Policy

- No assessments { Surveys, Quizzes, MPs } will be accepted late, for credit
- Make sure you know how to submit work before due date!
  - Failed submission is not a valid excuse for late submissions
- Contact me directly if there are extenuating circumstances, and I will
  consider on a case-by-case basis

---

<!-- jump_to_middle -->

## Have a great semester!
