resource "google_network_connectivity_hub" "primary"  {
 name        = "myhub"
 description = "A sample hub"
 
}

resource "google_compute_network" "vpc_network" {
  name = "myvpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
    name = "subnet1"
    network = google_compute_network.vpc_network.name
    region = var.var_region
    ip_cidr_range = "10.10.1.0/24"
}

resource "google_compute_subnetwork" "subnet2" {
    name = "subnet2"
    network = google_compute_network.vpc_network.name
    region = var.var_region
    ip_cidr_range = "10.10.2.0/24"
}

resource "google_compute_firewall" "subnet1tosubnet2" {
    name = "subnet1tosubnet2"
    network = google_compute_network.vpc_network.name
    priority = 10
    source_ranges = ["10.10.1.0/24"]
    destination_ranges = ["10.10.2.0/24"]
    allow {
        protocol = "tcp"
        ports = ["80"]
        }
}


resource "google_compute_instance" "vm1" {
  name         = "vm1"
  machine_type = "e2-micro"
  zone         = var.var_zone

  tags = ["subnet1"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet1.name
    network_ip = "10.10.1.5"
  }
}

resource "google_compute_instance" "vm2" {
  name         = "vm2"
  machine_type = "e2-micro"
  zone         = var.var_zone

  tags = ["subnet2"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet2.name
    network_ip = "10.10.2.5"
  }

  metadata_startup_script = <<-EOT
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
  EOT
}