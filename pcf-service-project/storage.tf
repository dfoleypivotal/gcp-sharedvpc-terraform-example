resource "google_storage_bucket" "director" {
  name          = "${var.env_name}-director"
  storage_class = "REGIONAL"
  location      = "${var.region}"
  force_destroy = true
}

resource "google_storage_bucket" "buildpacks" {
  name          = "${var.env_name}-buildpacks"
  storage_class = "REGIONAL"
  location      = "${var.region}"
  force_destroy = true
}

resource "google_storage_bucket" "droplets" {
  name          = "${var.env_name}-droplets"
  storage_class = "REGIONAL"
  location      = "${var.region}"
  force_destroy = true
}

resource "google_storage_bucket" "packages" {
  name          = "${var.env_name}-packages"
  storage_class = "REGIONAL"
  location      = "${var.region}"
  force_destroy = true
}

resource "google_storage_bucket" "resources" {
  name          = "${var.env_name}-resources"
  storage_class = "REGIONAL"
  location      = "${var.region}"
  force_destroy = true
}
