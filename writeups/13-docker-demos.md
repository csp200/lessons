---
title: "Docker Hands-On Demos"
author: "Michael Lee <lee@iit.edu>"
---

# Agenda

- Hello world
- Linux containers (Ubuntu & Alpine)
- Building simple images
  - Overview of *Dockerfile*s
  - hello-world image (simple & multi-stage)
- Working with *Volumes*
- Web server container (nginx)
- Database and Admin containers (Postgres & Adminer)
- Docker *Compose*
  - Simple database + admin
  - Notes web application

---

# Hello World

```bash
docker run hello-world

# `--rm` removes the container when it stops
docker run --rm hello-world

# list running containers (-a also shows stopped ones)
docker ps [-a]

# remove stopped containers
docker container prune 

# list images
docker image ls
```

---

# Linux images

## Ubuntu & Alpine

Commands to explore (`IMAGE` = `ubuntu` | `alpine`):

```bash
# show layers and other info about an image
docker history IMAGE

# run a command in the container
docker run IMAGE echo hello

# run a container interactively (with the default command) 
docker run -it IMAGE 

# run a command in a named container in the background (-d = "detach")
docker run --name CNAME -d IMAGE sleep infinity

# execute a command in a running container
docker exec CNAME ps ax

# execute and interact with a command in a running container
docker exec -it CNAME sh

# stop a running container (with some timeout)
docker stop CNAME
```

---

# Linux images

## Ubuntu & Alpine

Manually building/running hello world:

<!-- column_layout: [1, 1] -->

<!-- column: 0 -->

```bash
# start the container
docker run --rm -it alpine

# install development packages
apk add gcc musl-dev

# create the src directory
mkdir src
cd src
```

<!-- column: 1 -->

```bash
# create the source file
cat <<EOF > hello.c
#include <stdio.h>
int main() {
  printf("hello world\n");
  return 0;
}
EOF

# compile the source file
gcc hello.c -o hello

# run the executable
./hello
```

<!-- reset_layout -->

<!-- pause -->

Once we stop the container, all this setup is gone. Containers are *ephemeral*!

If we want to make this setup permanent, we can build a custom image.

---

# Building a Docker image

## Dockerfiles

A *Dockerfile* defines the blueprint for building a Docker image

- Automates the setup of an environment: OS, tools, code, and dependencies
- Documents the exact steps needed to reproduce a software setup
- Each instruction (e.g., `RUN`, `COPY`) creates a new *layer* in the image
  - Layers enable caching, reuse, and efficient rebuilds

Most images start from another base image, which acts as a foundational layer

---

# Building a Docker image

## "Hello world" image

From [Dockerfile](../src/docker/hello-world/Dockerfile):

```dockerfile
# Set the base image
FROM alpine:latest

# Install build dependencies 
RUN apk add --no-cache gcc musl-dev

# Create and set the working directory in the image
WORKDIR /src

# Copy hello.c from the build context to the image
COPY ./hello.c /src/

# Compile the source file and create the executable
RUN gcc hello.c -o hello

# Set the command to execute when the container is run
CMD ["/src/hello"]
```

To build (run in `../src/docker/hello-world`):

```bash
docker build -t hello-world .
```

---

# Building a Docker image

## "Hello world" multi-stage image

From [Dockerfile](../src/docker/hello-world-ms/Dockerfile):

```dockerfile
# Stage 1: Build the executable
FROM alpine:latest AS builder

RUN apk add gcc musl-dev

WORKDIR /src

COPY ./hello.c /src/

# "static" includes all libraries with the executable
RUN gcc -static -o hello hello.c

# Stage 2: Create minimal runtime image
FROM scratch

# Copy the executable from stage 1
COPY --from=builder /src/hello /hello

CMD ["/hello"]
```

To build (run in `../src/docker/hello-world-ms`):

```bash
docker build -t hello-world-ms .
```

---

# Working with *Volumes*

A Docker *volume* is a persistent storage mechanism used by containers.

- unlike the container's writable layer (which is ephemeral), volumes allow data
  to persist after a container is removed

- allows multiple containers to access/modify the same data

```bash
docker volume create my-vol
docker volume ls
docker volume inspect my-vol
docker run --rm -it -v my-vol:/data alpine
docker volume rm my-vol
```

---

# Bind mounts (Host path volumes)

As an alternative to a volume, it is also possible to *mount* a directory from
the host directly into the container

```bash
docker run --rm -it -v $(pwd):/data alpine
```

- convenient for local development
- less portable and more fragile
- can run into permission mismatches and platform-specific quirks

---

# Web server container (nginx)

Nice way to get a web server up and running quickly

- use *port-mapping* to access network applications

- use a volume/bind-mount to provide website data to the server

```bash
# -p 8080:80 maps port 8080 on the host to port 80 in the container
docker run --rm -d -p 8080:80 --name my-nginx nginx

docker logs my-nginx

docker exec -it my-nginx bash 

cd /usr/share/nginx/html/
echo hello > index.html

docker stop my-nginx

# place website in "./my-site" and use a bind mount
docker run --rm -d -p 8080:80 \
  -v $(pwd)/my-site:/usr/share/nginx/html:ro \
  --name my-nginx nginx
```

---

# Database and Admin containers (Postgres & Adminer)

Let's run and connect two containers:

- a relational database management system (PostgresQL)
- a web-driven administration console (Adminer)

<!-- column_layout: [1,1] -->

<!-- column: 0 -->

```bash
# set up network
docker network create my-net

# run database container
docker run --rm -d \
  --name my-postgres \
  --network my-net \
  -e POSTGRES_PASSWORD=mypass \
  -e POSTGRES_USER=myuser \
  -e POSTGRES_DB=mydb \
  -p 5432:5432 \
  postgres

# run web admin container
docker run --rm -d \
  --name my-adminer \
  --network my-net \
  -p 8080:8080 \
  adminer
```

<!-- column: 1 -->

```bash
# to check network connection
docker exec -it my-adminer sh
ping my-postgres

# to list database tables
docker exec -it my-postgres bash
psql -U myuser -d mydb
\dt

# to shutdown
docker stop my-postgres
docker stop my-adminer
docker network rm my-net
```

<!-- reset_layout -->

<!-- pause -->

Coordinating multiple containers is cool, but quite a hassle!

---

# Docker Compose

Docker Compose lets us define multi-container applications in a single YAML
file.

- manage services, dependencies, networks, volumes, etc..

<!-- pause -->

From [docker-compose.yaml](../src/docker/simple-db/docker-compose.yaml):

<!-- column_layout: [2,1] -->

<!-- column: 0 -->

```yaml
services:
  db:
    image: postgres:latest
    restart: always
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: postgres
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  adminer:
    image: adminer
    restart: always
    ports:
      - "8080:8080"
    depends_on:
      - db

volumes:
  postgres_data:
    driver: local
```

<!-- column: 1 -->

To start:

```bash
# detach with -d
docker-compose up
```

To stop:

```bash
# del vols with -v
docker-compose down
```

---

# Notes web application

A realistic Docker Compose setup for web application development.

Three containers based on:

- PostgreSQL database image
- Adminer web console image
- Custom Python image

<!-- column_layout: [1,1] -->

<!-- column: 0 -->

"docker-compose.yaml" (abridged):

```yaml
services:
  db:
    image: postgres
    environment:
      POSTGRES_USER: notes
      POSTGRES_PASSWORD: notes123
      POSTGRES_DB: notesdb
  adminer:
    image: adminer
    ports:
      - "8081:8080"
    depends_on:
      - db
  app:
    build: .
    depends_on:
      - db
    ports:
      - "8080:5000"
    volumes:
      - .:/app
```

<!-- column: 1 -->

Service interdependencies:

- adminer, app --> db
- Automatic restarts/delays

`app` image is built automatically from Dockerfile in the same directory

- Bind mount makes app source code available to Python container
