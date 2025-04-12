terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.29.0"
    }
  }
}

provider "google" {
  project = "master-456513"
  region = var.var_region
  zone = var.var_zone
  credentials = "/home/o_freetrails/tf-sa-cerdentials.json"
}
