resource "google_compute_network" "pcf-network" {
  name                    = "${var.network}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "infra-subnet" {
  name                     = "${var.env_name}-infra-subnet"
  network                  = "${google_compute_network.pcf-network.self_link}"
  ip_cidr_range            = "${var.infra_subnet_range}"
  private_ip_google_access = "true"
  region                   = "${var.region}"
}

resource "google_compute_subnetwork" "pas-subnet" {
  name                     = "${var.env_name}-pas-subnet"
  network                  = "${google_compute_network.pcf-network.self_link}"
  ip_cidr_range            = "${var.pas_subnet_range}"
  private_ip_google_access = "true"
  region                   = "${var.region}"
}

resource "google_compute_subnetwork" "services-subnet" {
  name                     = "${var.env_name}-services-subnet"
  network                  = "${google_compute_network.pcf-network.self_link}"
  ip_cidr_range            = "${var.services_subnet_range}"
  private_ip_google_access = "true"
  region                   = "${var.region}"
}

resource "google_compute_router" "router" {
  name    = "${var.env_name}-router"
  region  = "${google_compute_subnetwork.infra-subnet.region}"
  network = "${google_compute_network.pcf-network.self_link}"

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "simple-nat" {
  name                               = "${var.env_name}-nat"
  router                             = "${google_compute_router.router.name}"
  region                             = "${var.region}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
