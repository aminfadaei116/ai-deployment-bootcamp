variable "project" {
  type = string
}

variable "region" {
  type = string
}

provider "google" {
  project = var.project
  region  = var.region
}

resource "google_service_account" "sa" {
  account_id = "demo-service-account"
  display_name = "The demo service account run by TA"
}

resource "google_project_iam_member" "storage_object_viewer" {
  project = var.project
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.sa.email}"
}

output "service_account_id" {
  value = google_service_account.sa.id
}

output "service_account_email" {
  value = google_service_account.sa.email
}