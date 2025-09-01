# Required providers block
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# Provider configuration block
provider "google" {
  project = "tcscesarjg"
  region  = "us-central1"
}
