FROM fluent/fluentd:v1.12-1
USER root

RUN fluent-gem install fluent-plugin-prometheus --no-document

COPY fluentd.conf /fluentd/etc/
USER fluent

