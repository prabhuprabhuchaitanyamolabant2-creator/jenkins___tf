provider "google" {
  credentials = file("gcp-terraform-ci.json") # Jenkins will inject this
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "network" {
  source          = "./modules/network"
  network_name    = var.network_name
  subnet_cidr     = var.subnet_cidr
  allow_http_cidr = var.allow_http_cidr
  region          = var.region
}

module "vm" {
  source   = "./modules/vm"
  vm_name  = var.vm_name
  vm_type  = var.vm_type
  zone     = var.zone
  subnet   = module.network.subnet_self_link
  tags     = ["http-server"]
}

module "db" {
  source     = "./modules/db"
  db_name    = var.db_name
  db_version = var.db_version
  region     = var.region
  tier       = var.db_tier
}
