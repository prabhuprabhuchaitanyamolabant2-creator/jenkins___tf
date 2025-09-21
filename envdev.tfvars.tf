project_id       = "website-471422"
region           = "us-central1"
zone             = "us-central1-a"

network_name     = "vpc-dev"
subnet_cidr      = "10.10.0.0/24"
allow_http_cidr  = "0.0.0.0/0"

vm_name = "dev-web-1"
vm_type = "e2-micro"

db_name    = "dev-postgres"
db_version = "POSTGRES_14"
db_tier    = "db-f1-micro"
