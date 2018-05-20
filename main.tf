variable "project" {}
variable "region" {}
variable "zone" {}


provider "google" {
  credentials = "${file("account.json")}"
  project = "${var.project}"
  region = "${var.region}"
}

resource "google_compute_instance" "default" {
  name = "main"
  machine_type = "f1-micro"
  zone = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }
  
  network_interface {
    network = "default"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
