# Stage 1: Build the executable
FROM alpine:latest AS builder

RUN apk add gcc musl-dev

WORKDIR /src

COPY ./hello.c /src/

# Note: "static" effectively includes all libraries with the executable
RUN gcc -static -o hello hello.c

# Stage 2: Create minimal runtime image
FROM scratch

# Copy the executable from stage 1
COPY --from=builder /src/hello /hello

CMD ["/hello"]
