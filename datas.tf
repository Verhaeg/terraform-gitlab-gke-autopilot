data "google_organization" "main" {
  domain = var.organization
}

data "google_billing_account" "main" {
  display_name = var.billing_account
  open         = true
}

data "google_client_config" "default" {}

data "http" "public_ip" {
  url = "https://ipv4.icanhazip.com"
}
