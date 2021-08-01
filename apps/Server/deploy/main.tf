provider "google" {
  project = var.PROJECT
  region  = var.REGION
}

resource "google_cloud_run_service" "default" {
  name     = var.CLOUD_SERVICE_NAME
  location = var.REGION

  template {
    spec {
    #   service_account_name = var.service_account
      containers {
        image = var.CONTAINER_IMAGE
        ports {
          container_port = 7687
        }

        dynamic "env" {
          for_each = var.ENVS
          content {
            name = env.key
            value = env.value
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

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}