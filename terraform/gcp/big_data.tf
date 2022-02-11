resource google_sql_database_instance "master_instance" {
  name             = "terragoat-${var.environment}-master"
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "WWW"
        value = "0.0.0.0/0"
      }
    }
    backup_configuration {
      enabled = false
    }
  }
}

resource google_bigquery_dataset "dataset" {
  dataset_id = "terragoat_${var.environment}_dataset"
  access {
    special_group = "allAuthenticatedUsers"
    role          = "READER"
  }
  labels = {
    git_commit           = "37914a45800114d263c0dcd74b81b9dd01307e13"
    git_file             = "terraform__gcp__big_data_tf"
    git_last_modified_at = "2020-07-09-13-43-30"
    git_last_modified_by = "nimrodkor"
    git_modifiers        = "nimrodkor"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "4a0e7a57-3529-4e10-8ff0-0bd331877f5f"
  }
}
