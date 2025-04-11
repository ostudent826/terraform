resource "google_storage_bucket" "ofribucket" {
 name = "ofribucket"
 location = var.var_region
}

resource "google_storage_bucket" "test-conolse-buicklet" {
 name = "test-conolse-buicklet"
 location = var.var_region
}
