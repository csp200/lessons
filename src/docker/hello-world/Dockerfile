FROM alpine:latest AS builder

# Install build dependencies 
RUN apk add --no-cache gcc musl-dev

# Create the source file
WORKDIR /src
COPY ./hello.c /src/

RUN gcc -o hello hello.c

# Set the entrypoint
ENTRYPOINT ["/src/hello"]
