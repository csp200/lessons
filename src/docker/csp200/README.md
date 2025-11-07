# CSP 200 Dockerfile

The Dockerfile in this repository builds an image that contains tools and
configurations used for in-class demos and machine problems.

The best way to use this repository is to clone it, customize the Dockerfile,
and build your own local image with the command (run in the repository root):

```bash
docker build -t csp200 .
```

A `docker-compose.yaml` is also included to run two networked containers, to
experiment with networking/infosec concepts. To use it, do:

```bash
docker-compose up -d
```

Then spin down the containers and network with:

```bash
docker-compose down
```

---

You can also pull a pre-built image from Docker Hub by doing:

```bash
docker run -it michaelee/csp200
```

If you do this, be sure to override the baked in Git configuration (if you're
going to use Git in the container) by either mounting a `.gitconfig` or running
the following commands after starting the container:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```
