resource "google_compute_network" "tflab-vpc-1" {
  name = "tflab-vpc-1"
  auto_create_subnetworks = false
  mtu = 1460
}


resource "google_compute_network" "tflab-vpc-2" {
  project = var.var_project
  name = "tflab-vpc-2"
  auto_create_subnetworks = false
  mtu = 1460
}


resource "google_compute_subnetwork" "tflab-subnet-1" {
    name = "tflab-subnet-1"
    network = google_compute_network.tflab-vpc-1.name
    region = var.var_region
    ip_cidr_range = "10.10.10.0/24"
}

resource "google_compute_subnetwork" "tflab-subnet-2" {
    name = "tflab-subnet-2"
    network = google_compute_network.tflab-vpc-2.name
    region = var.var_region
    ip_cidr_range = "10.10.20.0/24"
}
