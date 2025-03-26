---
title: "Docker hands-on demos"
author: "Michael Lee"
---

# Hello World

```bash
docker run hello-world
```

---

# Linux images

## Ubuntu & Alpine

Commands to explore:

```bash
docker run IMAGE
docker run IMAGE echo hello
docker ps
docker ps -a
docker container prune
docker history IMAGE
docker run --rm -it IMAGE
docker run --rm -d IMAGE sleep infinity
docker exec -it CONTAINER sh
docker stop CONTAINER
```

---

# Linux images

## Ubuntu & Alpine

Building hello world:

```bash
docker run --rm -it alpine
apk add gcc musl-dev
cat <<EOF > hello.c
#include <stdio.h>
int main() {
  printf("hello world\n");
  return 0;
}
EOF
gcc hello.c
```

---

# Linux images

## Ubuntu & Alpine

Volume management:

```bash
docker run --rm -it -v my_vol:/data alpine
docker run --rm -it -v $(pwd):/data alpine
docker volume ls
```

---

# Web server: Nginx

```bash
docker run --rm -d -p 8080:80 --name my-nginx nginx
docker run --rm -d -p 8080:80 \
  -v $(pwd)/my-site:/usr/share/nginx/html:ro \
  --name my-nginx nginx
docker logs my-nginx
docker stop my-nginx
```

---

# Building a Docker image

## hello-world image

```Dockerfile
FROM alpine:latest AS builder

# Install build dependencies 
RUN apk add --no-cache gcc musl-dev

# Create the source file
WORKDIR /src
COPY ./hello.c /src/

RUN gcc -o hello hello.c

# Set the entrypoint
ENTRYPOINT ["/src/hello"]
```

---

# Building a Docker image

## hello-world multi-stage image

```Dockerfile
# Stage 1: Build the executable
FROM alpine:latest AS builder

# Install build dependencies
RUN apk add gcc musl-dev

# Copy the source file into the image
WORKDIR /src
COPY ./hello.c /src/

# Compile the program statically
RUN gcc -static -o hello hello.c

# Stage 2: Create minimal runtime image
FROM scratch

# Copy the compiled executable
COPY --from=builder /src/hello /hello

# Set the entrypoint
ENTRYPOINT ["/hello"]
```
