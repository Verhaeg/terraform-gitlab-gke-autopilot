module "gitlab_ip" {
  source  = "terraform-google-modules/address/google"
  version = "3.1.2"

  project_id = module.project.project_id
  region     = var.region

  address_type = "EXTERNAL"

  enable_cloud_dns = true
  dns_project      = var.dns_config["project"]
  dns_domain       = var.dns_config["domain"]
  dns_managed_zone = var.dns_config["zone"]
  dns_ttl          = var.dns_config["ttl"]
  dns_record_type  = var.dns_config["type"]

  names = ["gitlab-${var.region}"]
  #   dns_short_names = [ "gitlab", "registry", "minio" ]
  dns_short_names = ["gitlab"]
}

resource "google_dns_record_set" "minio" {
  name         = "minio.${var.dns_config["domain"]}."
  managed_zone = var.dns_config["zone"]
  type         = var.dns_config["type"]
  ttl          = var.dns_config["ttl"]
  rrdatas      = module.gitlab_ip.addresses
  project      = var.dns_config["project"]
}

resource "google_dns_record_set" "registry" {
  name         = "registry.${var.dns_config["domain"]}."
  managed_zone = var.dns_config["zone"]
  type         = var.dns_config["type"]
  ttl          = var.dns_config["ttl"]
  rrdatas      = module.gitlab_ip.addresses
  project      = var.dns_config["project"]
}

resource "google_dns_record_set" "kas" {
  name         = "kas.${var.dns_config["domain"]}."
  managed_zone = var.dns_config["zone"]
  type         = var.dns_config["type"]
  ttl          = var.dns_config["ttl"]
  rrdatas      = module.gitlab_ip.addresses
  project      = var.dns_config["project"]
}
