FROM fluent/fluentd:edge-debian

# Set environment variable for Fluentd config
ENV FLUENTD_CONF=fluentd.conf

# Create the directory for gem caching
RUN mkdir -p /home/fluent/.local/share/gem/ruby/3.1.0/cache

# Install Fluentd Prometheus plugin
RUN gem install fluent-plugin-prometheus --no-document

# Copy Fluentd configuration file
COPY fluentd.conf /fluentd/etc/fluentd.conf

# Expose Fluentd and Prometheus ports
EXPOSE 24224 24231

# Run Fluentd command by default
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins