# Use Fluentd's latest image
FROM fluent/fluentd

# Set environment variable for Fluentd config
ENV FLUENTD_CONF=fluentd.conf

# Install Prometheus plugin
RUN ["gem", "install", "fluent-plugin-prometheus", "--no-document"]

# Copy your Fluentd configuration file into the container
COPY fluentd.conf /fluentd/etc/fluentd.conf

# Expose the Fluentd port
EXPOSE 24224

# Run Fluentd command by default
CMD ["fluentd", "-c", "/fluentd/etc/$FLUENTD_CONF", "-p", "/fluentd/plugins"]
