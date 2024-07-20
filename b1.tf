provider "google" {
  project = "your-project-id"
  region  = "us-central1"  # Replace with your desired region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
}

# Define the GCS bucket resource
resource "google_storage_bucket" "my_bucket" {
  name     = "my-unique-bucket-name"  # Replace with your desired bucket name
  location = "US"  # Replace with your desired location
}

resource "google_storage_bucket" "my_bucket" {
  name          = "your-bucket-name"
  location      = "your-preferred-location"
  storage_class = "STANDARD"  # or choose a different storage class if needed

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    environment = "dev"
  }
}
