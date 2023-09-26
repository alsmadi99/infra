# Use a base image with Go and gcc installed
FROM golang:1.16 as builder

# Install Oniguruma library
RUN apt-get update && apt-get install -y libonig-dev

# Clone the grok_exporter repository
RUN git clone https://github.com/fstab/grok_exporter.git /go/src/grok_exporter

# Build grok_exporter
WORKDIR /go/src/grok_exporter
RUN git submodule update --init --recursive
RUN go install .

# Create the final image
FROM ubuntu:latest

# Copy the grok_exporter binary from the builder image
COPY --from=builder /go/bin/grok_exporter /usr/local/bin/grok_exporter

# Copy the libonig shared library from the builder image
COPY --from=builder /usr/lib/x86_64-linux-gnu/libonig.so.5 /usr/lib/x86_64-linux-gnu/libonig.so.5

# Copy your config file and patterns directory
COPY ./config.yml /etc/grok_exporter/config.yml
COPY ./patterns /etc/grok_exporter/patterns

# Run grok_exporter
CMD ["/usr/local/bin/grok_exporter", "-config", "/etc/grok_exporter/config.yml"]
