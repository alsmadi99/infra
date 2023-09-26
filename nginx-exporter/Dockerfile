# Use the official NGINX Prometheus Exporter image
FROM nginx/nginx-prometheus-exporter:latest

# Command to start the exporter
CMD ["-nginx.scrape-uri=http://my-nginx/nginx_status"]