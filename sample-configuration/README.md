# Sample Configuration for Terraform Module

This directory contains a sample configuration to demonstrate the usage of the reusable Terraform module.

## Steps

1. **Clone the repository**:
   ```bash
   git clone <repository_url>
   cd <repository_directory>/sample-configuration
   ```

2. **Authenticate with Google Cloud**:
    ```bash
    gcloud auth login
    gcloud config set project YOUR_PROJECT_ID
    ```

3. **Initialize and apply Terraform**:
    ```bash
    terraform init
    terraform apply
    ```

4. **Access your Cloud Run service**:
    ```bash
    Terraform will output the URL of your Cloud Run service upon successful deployment.
    ```
