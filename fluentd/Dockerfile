FROM fluent/fluentd:edge-debian

# Switch to root user to install packages
USER smadi

# Install Fluentd Prometheus plugin
RUN gem install fluent-plugin-prometheus --no-document

# Switch back to the original user
USER fluent

# Set environment variable for Fluentd config
ENV FLUENTD_CONF=fluentd.conf

# Copy Fluentd configuration file
COPY fluentd.conf /fluentd/etc/fluentd.conf

# Expose Fluentd and Prometheus ports
EXPOSE 24224 24231

# Run Fluentd command by default
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins