# Use the official Blackbox Exporter image
FROM prom/blackbox-exporter:latest

# Copy the configuration file into the container
COPY blackbox.yml /etc/blackbox_exporter/config.yml

# Expose the port
EXPOSE 9114
