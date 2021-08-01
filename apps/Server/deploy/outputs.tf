output "Deployment_URL" {
  value = google_cloud_run_service.default.status.0.url
}

output "Revision_Name" {
    value = google_cloud_run_service.default.status.0.latest_created_revision_name
}