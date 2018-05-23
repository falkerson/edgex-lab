provider "google" {
  credentials = "${file("account.json")}"
  project = "${var.project}"
  region = "${var.region}"
}

resource "google_compute_firewall" "www" {
  name    = "web-firewall"
  network = "default"
  
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}

resource "google_compute_instance" "www" {
  name = "api"
  machine_type = "n1-standard-1"
  zone = "${var.zone}"
  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
      
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      private_key = "${file("${var.private_key_path}")}"
      agent       = false
    }

    scripts = [
      "scripts/install_docker.sh",
      "scripts/install_nginx.sh"
    ]
  }
  
  network_interface {
    network = "default"
    access_config {
      nat_ip = "${var.public_ip}"
    }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  metadata {
    ssh-keys = "root:${file("${var.public_key_path}")}"
  }
}

