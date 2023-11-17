terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}


provider "google" {
  credentials = file("../../../../google.json")
  project     = "graphic-mason-405418"
  region      = "europe-west3"
}

resource "google_compute_instance" "vm_instance" {
  name         = "docker-vm"
  machine_type = "e2-medium"
  zone         = "europe-west3-a"

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    "gce-container-declaration" = <<CONTAINER
spec:
  containers:
    - name: example-container
      image: 'busybox:latest'
      stdin: false
      tty: false
  restartPolicy: Always
CONTAINER
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  tags = ["docker-vm"]
}


resource "google_artifact_registry_repository" "docker_repo" {
  provider = google

  location      = "europe-west3"
  repository_id = "my-docker-repo"
  description   = "Docker repository"
  format        = "DOCKER"
}


# resource "google_compute_instance" "vm_instance" {
#   // Configuration for VM instances
# }

# resource "google_compute_network" "vpc_network" {
#   // Configuration for VPC
# }

# resource "google_compute_firewall" "firewall" {
#   // Configuration for Firewall rules
# }

# resource "google_compute_address" "static_ip" {
#   // Configuration for static IP
# }

# resource "google_compute_managed_ssl_certificate" "ssl_certificate" {
#   // Configuration for SSL certificate
# }

# resource "google_dns_managed_zone" "dns_zone" {
#   // Configuration for Cloud DNS
# }

# resource "google_compute_http_health_check" "health_check" {
#   // Configuration for health checks
# }

# resource "google_compute_target_pool" "target_pool" {
#   // Configuration for target pools for load balancing
# }

# resource "google_compute_forwarding_rule" "forwarding_rule" {
#   // Configuration for forwarding rules
# }