
resource "google_compute_firewall" "allow_http_to_vm2" {
  name    = "allow-http-to-vm2"
  network = google_compute_network.tflab-vpc-2.name  # assuming vm-2 is in tflab-vpc-2

  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["10.10.10.0/24"] 

  target_tags = ["vm-2"]
}
