---
title: "Build automation with `make`"
author: "Michael Lee <lee@iit.edu>"
---

# Agenda

- What is build automation?
- Use Makefiles to automate builds
- Apply `make` in multi-file C projects
- Enforce automation discipline with Git hooks
- Connect build automation to version control

---

# What Is Build Automation?

- Automates repetitive, error-prone steps
- Ensures consistency and reproducibility
- Tracks file dependencies via timestamps

---

# Why Use One?

- Avoid rebuilds unless necessary
- Centralize your automation logic
- Reuse build logic across environments
- Reduce manual errors

---

# Building Hello World

```
src/build/hello/
└── hello.c
```

```bash
gcc -o hello hello.c
```

- what is the build *target*?
- what are its dependencies?
- what is the "recipe" for building the target (based on its dependencies)?

<!--
speaker_note: |
  hello: hello.c
      gcc -o hello hello.c
-->

---

# Building a Multi-File C Project

```
src/build/greet/
├── main.c
├── utils.c
└── utils.h
```

```bash
gcc -c utils.c
gcc -c main.c
gcc -o main main.o utils.o
```

<!-- pause -->

- what are the build *target*s?
- what are their dependencies?
- what are their recipes?

<!--
speaker_note: |
  - Variable use: `CC`, `CFLAGS`, `OBJ`
  - Pattern rules: `%.o : %.c`
  - Automatic variables: `$<`
  - Custom targets: `clean`

    CC = gcc
    CFLAGS = -Wall -g
    OBJ = main.o utils.o

    main: $(OBJ)
    $(CC) $(CFLAGS) -o main $(OBJ)

    %.o: %.c
    $(CC) $(CFLAGS) -c $<

    clean:
    rm -f main *.o
-->

---

# Tips and Flags

- `make`: rebuild only changed targets
- `make -n`: dry run
- `make -B`: force full rebuild
- `touch file`: test timestamp behavior

---

# What Are Git Hooks?

- Local scripts triggered by Git events
- Not versioned with the repo
- Useful for automation and quality checks
- Look in `.git/hooks/` for sample hooks
- Examples:
  - `pre-commit`
  - `commit-msg`
  - `pre-push`

---

# Pre-commit Hook Example

```bash
#!/bin/sh
echo "[hook] Checking build before commit..."
if ! make; then
    echo "[hook] Build failed. Commit aborted."
    exit 1
fi
```

- Blocks bad commits locally
- Encourages clean, working states

---

# Installing a Hook

```bash
cp script.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

- Must be placed in `.git/hooks/`
- Must be executable
- Runs automatically on `git commit`

---

# Pros and Caveats

- Prevent broken code from being committed
- Enforce consistency and build health
- Not shared via Git (local only)
- Can be bypassed with `--no-verify`
- Use CI/CD for team-wide enforcement

---

# Wrap-Up & Takeaways

- `make` = declarative automation with dependencies
- Enables reproducible, clean build processes
- Git hooks extend automation into version control
- Helps form good habits in software development
