provider "google" {
  project = var.project_id
  region  = var.region
}

# Define a resource block for each bucket using for_each
resource "google_storage_bucket" "my_buckets" {
  for_each = var.buckets

  name          = each.value.name
  location      = each.value.location
  storage_class = each.value.storage_class

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
