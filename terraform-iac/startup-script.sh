#!/bin/bash
# Ensure docker is installed and start the daemon
sudo systemctl start docker

# Authenticate to Google Artifact Registry
gcloud auth configure-docker europe-west3-docker.pkg.dev

# Pull the images from the Artifact Registry
docker pull europe-west3-docker.pkg.dev/your-project-id/my-docker-repo/my-nginx
# ... and so on for each image

# Run the Docker containers
# ... similar to what you had in your GitHub Actions
