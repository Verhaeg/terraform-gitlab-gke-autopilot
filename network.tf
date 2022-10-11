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
