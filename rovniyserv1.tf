provider "google" {
    credentials = "${file("client_secret.json")}"
    project     = "rovniyserv1"
    region      = "us-central"
}

resource "google_compute_instance" "default" {
    
    name         = "lamp"
    machine_type = "n1-standart-1"
    zone         = "us-central-a"

    tags         = ["foo", "bar"]

    boot_disk {
        initialize_params {
            image = "centOS7"
        }
    }
    disk 
    scratch_disc {}
    network_interface {network = "default"
    access_config {192.168.1.115}
    }
}
metadata {
    foo = "bar"
}

metadata_startup_script = "echo hi > /test.txt"

service_account {
    scopes = ["rovserg@gmail.com", "compute_ro", "storage_ro"]
}
