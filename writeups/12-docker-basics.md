---
Author: Michael Lee
Paging: "%d / %d"
---

# Introduction to Containers and Docker

---

## Traditional Deployment Challenges

- Applications installed directly on physical machines
- Inefficient resource usage due to dedicated servers
- Dependency conflicts between applications

---

## What are Containers?

- Lightweight, portable way to package and run applications
- Encapsulate application and dependencies
- Provide a consistent runtime environment
- May share "host OS/machine" with other containers, but in an isolated way

---

## Why Containers?

- Enhance resource utilization vs. traditional virtualization
- Solve "it works on my machine" problem
- Improve deployment consistency

---

## Before Containers: Virtual Machines (VMs)

- Use hypervisors (VMware, VirtualBox, KVM)
- Allow multiple OS instances per machine
- Provide isolation and better resource use
- High overhead, slow startup

---

## VMs -> Containers

- Share host OS kernel (lower overhead)
- Faster startup than VMs
- More efficient resource utilization
- Key technologies: chroot, cgroups, namespaces

---

## What is Docker?

- Open-source containerization platform
- Develop, ship, and run applications in containers
- Provides CLI and APIs for management

---

## Essential Container/Docker Terminology

- **Image**: Read-only template for creating containers
- **Container**: A running instance of an image
- **Dockerfile**: Script to define an image
- **Registry**: Storage for container images (e.g., Docker Hub)
- **Volume**: Persistent storage for containers
- **Orchestration**: Automated management of containers (e.g., Kubernetes)

---

## Key Components of Docker

- **Docker Engine**: Runs/manages containers
- **Docker Images**: Blueprint for containers
- **Docker Containers**: Running instances
- **Docker Hub**: Registry for sharing images
- **Dockerfile**: Defines custom images

---

## Common Use Cases (Basic)

- Development & Testing: Consistent environments
- Running applications in isolation
- Microservices architecture

---

## Common Use Cases (Intermediate)

- CI/CD Pipelines: Automate testing/deployment
- Scaling Applications: Container orchestration
- Portability across cloud providers

---

## Common Use Cases (Advanced)

- Edge Computing & IoT deployments
- Machine Learning pipelines
- Serverless computing with containers

---

## Demo 1: Running a Simple Container

```bash
docker run -it ubuntu bash
docker ps
docker ps -a
```

- Shell runs inside a container --- no fear of messing things up!

---

## Demo 2: Running a Web Server

```bash
docker run -d -p 8080:80 nginx
docker ps
```

- Access in browser: http://localhost:8080

---

## Stopping and Removing Containers

```bash
docker stop <container_id>
docker rm <container_id>
```

---

## Customizing the Nginx Webpage

Create a custom webpage -- "index.html"

```html
<!DOCTYPE html>
<html>
<body>
  <p>Hello from inside the container!</p>
</body>
</html>
```

Attach a volume to the container:

```bash
docker run -d -p 8080:80 -v $(pwd)/index.html:/usr/share/nginx/html/index.html nginx
```

---

## Demo 3: Building a Custom Container

**Dockerfile:**

```dockerfile
FROM alpine:latest
WORKDIR /src
COPY script.sh /src/
RUN chmod +x /src/script.sh
CMD ["/src/script.sh"]
```

## Simple Shell Script (`script.sh`)

```sh
#!/bin/sh

echo "Hello from inside the Docker container!"
echo -e "\nRoot directory contents:"
ls /

echo -e "\nCurrently running processes:"
ps aux
```

---

## Building and Running the Custom Container

```bash
docker build -t simple .
docker run simple
```

---

## Typical Container Workflow

### Step 1: Define Environment

- Choose base image (e.g., `alpine`)
- Write a `Dockerfile` with dependencies

---

## Step 2: Build the Container Image

```bash
docker build -t my-image .
```

---

## Step 3: Run and Test the Container

```bash
docker run my-image
```

---

## Step 4: Push to a Registry

```bash
docker tag my-image myrepo/my-image:v1
docker push myrepo/my-image:v1
```

- Enables sharing and deployment

---

## Step 5: Deploy in Production

- Use **Docker Compose** for multi-container apps
- Use **Kubernetes** for large-scale deployments
- Monitor containers with **Prometheus, Grafana**
