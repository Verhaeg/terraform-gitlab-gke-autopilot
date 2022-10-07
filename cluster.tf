module "gke" {
  # https://github.com/terraform-google-modules/terraform-google-kubernetes-engine
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  version = "~> 23.1"

  depends_on = [
    module.project
  ]

  project_id        = module.project.project_id
  name              = "gitlab"
  region            = var.region
  zones             = var.zones
  network           = var.vpc_name
  subnetwork        = "${var.vpc_name}-01"
  ip_range_pods     = "${var.vpc_name}-01-pods"
  ip_range_services = "${var.vpc_name}-01-services"

  add_cluster_firewall_rules        = true
  add_master_webhook_firewall_rules = true
  http_load_balancing               = true
  horizontal_pod_autoscaling        = true
  enable_vertical_pod_autoscaling   = true

  cluster_resource_labels = merge(var.labels, { infra-type : "cluster" })
  cluster_telemetry_type  = "ENABLED"

  registry_project_ids  = var.registry_projects
  grant_registry_access = true

  master_authorized_networks = local.master_authorized_networks

  datapath_provider = "ADVANCED_DATAPATH"
}

resource "kubernetes_namespace" "auto" {
  for_each = toset(concat(var.namespaces, ["monitoring"]))

  depends_on = [
    module.gke
  ]

  metadata {
    name = each.value
  }
}
