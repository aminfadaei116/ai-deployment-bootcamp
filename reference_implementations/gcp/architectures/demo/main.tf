provider "google" {
  project = "ai-deployment-bootcamp-430513"
  region  = "us-central1"
}

resource "google_service_account" "sa" {
  account_id = "demo-service-account"
  display_name = "The demo service account"
}

#resource "google_project_iam_member" "storage_object_viewer" {
#  project = "ai-deployment-bootcamp-430513"
#  role    = "roles/aiplatform.user"
#  member  = "serviceAccount:${google_service_account.sa.email}"
#}

output "service_account_id" {
  value = google_service_account.sa.id
}

output "service_account_email" {
  value = google_service_account.sa.email
}