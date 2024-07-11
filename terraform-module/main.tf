provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  count                     = length(var.subnet_cidrs)
  name                      = "${var.vpc_name}-subnet-${count.index + 1}"
  ip_cidr_range             = var.subnet_cidrs[count.index]
  network                   = google_compute_network.vpc_network.id
  region                    = var.region
  private_ip_google_access  = true
  secondary_ip_range {
    range_name    = "secondary-range"
    ip_cidr_range = "10.4.${count.index}.0/24"
  }
}

resource "google_artifact_registry_repository" "repo" {
  location       = var.region
  repository_id  = "my-repo"
  description    = "Docker repository"
  format         = "DOCKER"
}

resource "google_cloud_run_service" "cloud_run_service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
        resources {
          limits = {
            memory = var.memory
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_project_iam_member" "run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "allUsers"
}
