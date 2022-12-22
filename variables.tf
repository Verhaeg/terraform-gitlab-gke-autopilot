variable "billing_account" {
  type = string

  description = "Name of the associated BillingAccount"
}

variable "organization" {
  type = string

  description = "Which organization this project belongs to"
}

variable "folder_id" {
  type    = string
  default = ""

  description = "ID of the folder that this project will reside on in the form: folders/<id>"
}

variable "project_name" {
  type = string

  description = "Display name for the project"
}

variable "project_id" {
  type = string

  description = "Internal custom ID for the project or leave null to generate a random ID"
}

variable "region" {
  type    = string
  default = "us-central1"

  description = "GCP region to deploy the cluster to"
}

variable "zones" {
  type    = list(string)
  default = ["us-central1-a", "us-central1-b", "us-central1-f"]

  description = "GCP zones to deploy the cluster to"
}

variable "vpc_name" {
  type    = string
  default = "us-central1"

  description = "GCP region to deploy the cluster to"
}

variable "labels" {
  type = object({
    cost-center = string
    cost-type   = string
    role        = string
    team        = string
    environment = string
  })

  description = "Labels to be applies to the project. Infra-Type label is always applied"

  validation {
    condition = alltrue(
      [for l, v in var.labels : can(regex("^[a-z0-9_\\-]{1,64}$", v))]
    )
    error_message = "Invalid label value."
  }
}

variable "registry_projects" {
  type    = list(string)
  default = []

  description = "List of projects that contain Docker images this cluster might use"
}

variable "master_authorized_networks_extra_ips" {
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = []

  description = "List of objects with extra IPs to add to master authorized networks"
}

variable "namespaces" {
  type    = list(string)
  default = []

  description = "List of desired namespaces to be created"
}

variable "gitlab" {
  type = object({
    domain          = string
    cert_email      = string
    namespace       = string
    version         = string
    bucket_prefix   = string
    bucket_location = string
    cache_type      = string
    cache_bucket    = string
  })

  description = "Set of configurations for GitLab"
}

variable "dns_config" {
  type = object({
    project = string
    domain  = string
    ttl     = number
    type    = string
    zone    = string
  })

  description = "Default configuration for DNS project and configs"
}

variable "gitlab_omni_google" {
  type = object({
    app_id     = string
    app_secret = string
  })
  default = {
    app_id     = ""
    app_secret = ""
  }

  description = "Omniauth Provider configuration for Google"
}
variable "gitlab_omni_gitlab" {
  type = object({
    app_id     = string
    app_secret = string
  })
  default = {
    app_id     = ""
    app_secret = ""
  }

  description = "Omniauth Provider configuration for GitLab"
}

locals {
  service_apis = [
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "monitoring.googleapis.com",
  ]

  caller_ip = chomp(data.http.public_ip.response_body)

  master_authorized_networks = concat(
    [
      {
        cidr_block   = "${local.caller_ip}/32",
        display_name = "Terraform caller IP"
      }
    ],
    var.master_authorized_networks_extra_ips
  )
}
