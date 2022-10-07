terraform {
  required_version = ">= 1.2.0, <2.0.0"

  required_providers {
    google = {
      source  = "google"
      version = ">= 4.38"
    }

    google-beta = {
      source  = "google-beta"
      version = ">= 4.38"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  }
}
