/*
# The main resource block for creating a GCP Compute Engine instance
resource "google_compute_instance" "vm_test1" {
  name         = "terraform-vm-edher"
  machine_type = "e2-medium"
  zone         = var.zone

  # The boot disk for the VM. This is the OS drive.
  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20230509"
    }
  }

  # The network interface for the VM
  network_interface {
    # The network this VM will be attached to.
    # You can specify a custom network here. This example uses the default.
    network = "default"
  
    # The access config block gives the VM a public IP address.
    # This is required to access the VM from the internet (e.g., via SSH).
    access_config {
      # This block can be empty.
    }
  }

}
*/



resource "google_compute_address" "static_ip" {
  count = var.static_ip ? 1 : 0

  project      = var.project_id
  name         = "test-static-ip"
  region       = "us-central1"
  subnetwork   = "default"
  address_type = "INTERNAL"
  purpose      = "GCE_ENDPOINT"
}

resource "google_compute_instance" "test_instance" {
  project      = var.project_id
  zone         = var.zone
  machine_type = "n1-standard-1"

  allow_stopping_for_update = false

  name = "test-instance-case-62016924-edher"
 
  # The boot disk for the VM. This is the OS drive.
  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20230509"
    }
  }
  

  network_interface {
    subnetwork = "default"
    network_ip = var.static_ip ? google_compute_address.static_ip[0].address : null
  }
}

