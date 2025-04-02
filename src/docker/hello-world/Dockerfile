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
# CMD ["/src/hello"]
CMD ["/src/hello"]
