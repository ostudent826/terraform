
resource "google_network_connectivity_spoke" "spoke1_vpc_connection" {
  name     = "tflab-vpc-spoke-1"
  location = "global"
  project  = var.var_project
  
  hub = "projects/master-456513/locations/global/hubs/tflab-hub"


  linked_vpc_network {
    uri = google_compute_network.tflab-vpc-1.self_link
  }
}


resource "google_network_connectivity_spoke" "spoke2_vpc_connection" {
  name     = "tflab-vpc-spoke-2"
  location = "global"
  project  = var.var_project
  
  hub = "projects/master-456513/locations/global/hubs/tflab-hub"


  linked_vpc_network {
    uri = google_compute_network.tflab-vpc-2.self_link
  }
}

