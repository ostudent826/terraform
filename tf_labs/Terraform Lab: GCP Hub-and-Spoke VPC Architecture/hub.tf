resource "google_network_connectivity_hub" "tflab-hub"  {
 name        = "tflab-hub"
 description = "A sample hub"
 preset_topology = "MESH"
 project = var.var_project
 labels = {
    label-one = "tf-managed"
  }
}
