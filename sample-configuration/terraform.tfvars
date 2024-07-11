project_id   = "your-project-id"
region       = "us-central1"
vpc_name     = "my-vpc"
vpc_cidr     = "10.0.0.0/16"
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
service_name = "hello-world"
image        = "us-central1-docker.pkg.dev/your-project-id/my-repo/hello-world"
memory       = "512Mi"
