resource "google_compute_firewall" "pcf-allow-pas-alll" {
  name        = "${var.env_name}-allow-pas-all"
  network     = "${google_compute_network.pcf-network.self_link}"
  target_tags = ["${var.env_name}", "pcf-opsman", "nat-traverse"]
  source_tags = ["${var.env_name}", "pcf-opsman", "nat-traverse"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }
}

resource "google_compute_firewall" "pcf-allow-ssh" {
  name        = "${var.env_name}-allow-ssh"
  network     = "${google_compute_network.pcf-network.self_link}"
  target_tags = ["allow-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["${var.on_premise_range}"]
}

resource "google_compute_firewall" "pcf-allow-rdp" {
  name        = "${var.env_name}-allow-rdp"
  network     = "${google_compute_network.pcf-network.self_link}"
  target_tags = ["allow-rdp"]

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["${var.on_premise_range}"]
}

resource "google_compute_firewall" "pcf-allow-http" {
  name        = "${var.env_name}-allow-http"
  network     = "${google_compute_network.pcf-network.self_link}"
  target_tags = ["allow-http", "router"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["${var.on_premise_range}"]
}

resource "google_compute_firewall" "pcf-allow-https" {
  name        = "${var.env_name}-allow-https"
  network     = "${google_compute_network.pcf-network.self_link}"
  target_tags = ["allow-https", "router"]

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["${var.on_premise_range}"]
}

resource "google_compute_firewall" "pcf-allow-http-8080" {
  name        = "${var.env_name}-allow-http-8080"
  network     = "${google_compute_network.pcf-network.self_link}"
  target_tags = ["router"]

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["${var.on_premise_range}"]
}
