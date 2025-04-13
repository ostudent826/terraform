
resource "google_compute_instance" "vm_1" {
  name         = "vm-1"
  machine_type = "e2-medium"
  zone         = var.var_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tflab-subnet-1.id
    access_config {}  # enables external IP
  }

  tags = ["vm-1"]
}

resource "google_compute_instance" "vm_2" {
  name         = "vm-2"
  machine_type = "e2-medium"
  zone         = var.var_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tflab-subnet-2.id
    access_config {}  # enables external IP
  }

  tags = ["vm-2"]
}
