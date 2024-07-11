# Terraform Module for VPC, Subnets, and Cloud Run

This module creates a VPC, subnets, and a Cloud Run service in Google Cloud Platform.

## Inputs

- `project_id`: The project ID to deploy to.
- `region`: The region to deploy to (default is `us-central1`).
- `vpc_name`: The name of the VPC.
- `vpc_cidr`: The CIDR block for the VPC.
- `subnet_cidrs`: The CIDR blocks for the subnets.
- `service_name`: The name of the Cloud Run service.
- `image`: The Docker image to deploy.
- `memory`: The memory allocation for the Cloud Run service (default is `512Mi`).

## Outputs

- `vpc_network`: The name of the created VPC network.
- `subnet_ids`: The IDs of the created subnets.
- `cloud_run_url`: The URL of the deployed Cloud Run service.

## Usage

```hcl
module "gcp_infrastructure" {
  source       = "../terraform-module"
  project_id   = "your-project-id"
  region       = "us-central1"
  vpc_name     = "my-vpc"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  service_name = "hello-world"
  image        = "us-central1-docker.pkg.dev/your-project-id/my-repo/hello-world"
  memory       = "512Mi"
}
