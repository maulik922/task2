output "vpc_network" {
  value = google_compute_network.vpc_network.name
}

output "subnet_ids" {
  value = [for subnet in google_compute_subnetwork.subnet : subnet.id]
}

output "cloud_run_url" {
  value = google_cloud_run_service.cloud_run_service.status[0].url
}
