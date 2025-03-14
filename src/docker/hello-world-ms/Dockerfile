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
