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
