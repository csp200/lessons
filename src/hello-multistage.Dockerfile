# Stage 1: Build the executable
FROM alpine:latest AS builder

# Install build dependencies
RUN apk add gcc musl-dev

# Create the source file
WORKDIR /src
COPY ./hello.c /src/

# COPY <<EOF /src/hello.c
# #include <stdio.h>

# int main() {
#   printf("Hello world!\\n");
#   return 0;
# }
# EOF

# Compile the program statically
RUN gcc -static -o hello hello.c

# Stage 2: Create minimal runtime image
FROM scratch

# Copy the compiled executable
COPY --from=builder /src/hello /hello

# Set the entrypoint
ENTRYPOINT ["/hello"]
