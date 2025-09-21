terraform {
  required_version = ">= 1.6.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.36"
    }
  }

  backend "gcs" {
    bucket = "website-471422-tf-state"
    prefix = "terraform/state"
  }
}
