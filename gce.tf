resource "google_compute_instance" "create-by-terraform" {
  name         = "create-by-terraform"
  machine_type = "e2-micro"
  zone         = "asia-northeast1-a"
  tags         = ["terraform-test"]

  boot_disk {
    initialize_params {
      size  = 10
      type  = "pd-standard"
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = ["logging-write", "monitoring-write"]
  }
}
