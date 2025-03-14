FROM alpine:latest AS builder

# Install build dependencies 
RUN apk add --no-cache gcc musl-dev

# Create the source file
WORKDIR /src
COPY <<EOF /src/hello.c
#include <stdio.h>

int main() {
  printf("Hello world!\\n");
  return 0;
}
EOF

RUN gcc -o hello hello.c

# Set the entrypoint
ENTRYPOINT ["/src/hello"]
