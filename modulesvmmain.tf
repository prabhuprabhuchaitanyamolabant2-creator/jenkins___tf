resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.vm_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork   = var.subnet
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    echo "Hello from Terraform on GCP" > /var/www/html/index.nginx-debian.html
    systemctl enable nginx
    systemctl restart nginx
  EOT
}
