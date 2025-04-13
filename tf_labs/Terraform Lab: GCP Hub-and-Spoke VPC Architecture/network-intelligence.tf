resource "google_network_management_connectivity_test" "vm1_to_vm2_http" {
  name     = "vm1-to-vm2-http-test"
  project  = "master-456513"
  protocol = "TCP"

  source {
    instance = google_compute_instance.vm_1.id
    port     = 80  # source port (any)
  }

  destination {
    instance = google_compute_instance.vm_2.id
    port     = 80
  }

  related_projects = ["master-456513"]
}


