resource "google_storage_bucket" "director" {
  name          = "${var.env_name}-director"
  storage_class = "MULTI_REGIONAL"
  force_destroy = true
}

resource "google_storage_bucket" "buildpacks" {
  name          = "${var.env_name}-buildpacks"
  storage_class = "MULTI_REGIONAL"
  force_destroy = true
}

resource "google_storage_bucket" "droplets" {
  name          = "${var.env_name}-droplets"
  storage_class = "MULTI_REGIONAL"
  force_destroy = true
}

resource "google_storage_bucket" "packages" {
  name          = "${var.env_name}-packages"
  storage_class = "MULTI_REGIONAL"
  force_destroy = true
}

resource "google_storage_bucket" "resources" {
  name          = "${var.env_name}-resources"
  storage_class = "MULTI_REGIONAL"
  force_destroy = true
}

resource "google_storage_bucket" "bosh" {
  name          = "${var.env_name}-bosh"
  storage_class = "MULTI_REGIONAL"
  force_destroy = true
}
