module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.2"

  project_id   = module.project.project_id
  network_name = var.vpc_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = "${var.vpc_name}-01"
      subnet_ip             = "192.168.0.0/20"
      subnet_region         = var.region
      subnet_private_access = "true"
    }
  ]

  secondary_ranges = {
    "${var.vpc_name}-01" = [
      {
        range_name    = "${var.vpc_name}-01-pods"
        ip_cidr_range = "10.4.0.0/14"
      },
      {
        range_name    = "${var.vpc_name}-01-services"
        ip_cidr_range = "10.0.32.0/20"
      },
    ]
  }

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    }
  ]
}

module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "1.3.0"

  name    = "router-${var.region}"
  project = module.project.project_id
  region  = var.region
  network = module.vpc.network_name
}

module "nat" {
  source  = "terraform-google-modules/cloud-nat/google"
  version = "2.2.1"

  project_id = module.project.project_id
  region     = var.region
  router     = module.cloud_router.router.name

  min_ports_per_vm = 512
}

# module "firewall_rules" {
#   source       = "terraform-google-modules/network/google//modules/firewall-rules"
#   version = "~> 5.2"

#   project_id   = module.project.project_id
#   network_name = module.vpc.network_name

#   rules = [{
#     name                    = "allow-ssh-ingress"
#     description             = null
#     direction               = "INGRESS"
#     priority                = null
#     ranges                  = ["0.0.0.0/0"]
#     source_tags             = null
#     source_service_accounts = null
#     target_tags             = null
#     target_service_accounts = null
#     allow = [{
#       protocol = "tcp"
#       ports    = ["22"]
#     }]
#     deny = []
#     log_config = {
#       metadata = "INCLUDE_ALL_METADATA"
#     }
#   }]
# }
