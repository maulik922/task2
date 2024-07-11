provider "google" {
  project = var.project_id
  region  = var.region
}

module "gcp_infrastructure" {
  source       = "../terraform-module"
  project_id   = var.project_id
  region       = var.region
  vpc_name     = var.vpc_name
  vpc_cidr     = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
  service_name = var.service_name
  image        = var.image
  memory       = var.memory
}

output "cloud_run_url" {
  value = module.gcp_infrastructure.cloud_run_url
}
