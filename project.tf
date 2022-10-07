module "project" {
  # https://github.com/terraform-google-modules/terraform-google-project-factory
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.0"

  name              = var.project_name
  project_id        = var.project_id
  random_project_id = false

  org_id          = data.google_organization.main.id
  folder_id       = var.folder_id
  billing_account = data.google_billing_account.main.id

  auto_create_network = false

  activate_apis = toset(local.service_apis)

  create_project_sa = false

  labels = merge(var.labels, { "infra-type" : "project" })
}

module "service_accounts" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "~> 4.1"

  project_id = module.project.project_id
  prefix     = "gitlab"
  names      = ["cluster"]
  project_roles = [
    "${module.project.project_id}=>roles/editor",
  ]
}

module "gitlab_gcs_connection_sa" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "~> 4.1"

  project_id = module.project.project_id
  prefix     = "gitlab"
  names      = ["connection"]
  project_roles = [
    "${module.project.project_id}=>roles/storage.admin",
  ]
  generate_keys = true
}
