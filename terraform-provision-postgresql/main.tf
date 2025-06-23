terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "postgresql" {
  count       = 1
  name        = "postgresql"
  target_node = "proxmox"
  clone       = "ubuntu-22-template"

  cores  = 2
  memory = 4000

  disks {
    virtio {
      virtio0 {
        disk {
          storage = "local-lvm"
          size    = "20"
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  agent = 1
  onboot = true

  ipconfig0 = "ip=192.168.0.101/24,gw=192.168.0.1"
}
