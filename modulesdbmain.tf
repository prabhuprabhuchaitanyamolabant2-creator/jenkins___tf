resource "google_sql_database_instance" "db" {
  name             = var.db_name
  database_version = var.db_version
  region           = var.region
  deletion_protection = false

  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled = true
    }
  }
}
