module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 3.4"

  project_id = module.project.project_id
  labels     = merge(var.labels, { "infra-type" : "storage" })
  location   = upper(var.gitlab["bucket_location"])

  names = [
    "gitlab-artifacts",
    "git-lfs",
    "gitlab-packages",
    "gitlab-uploads",
    "gitlab-mr-diffs",
    "gitlab-terraform-state",
    "gitlab-ci-secure-files",
    "gitlab-dependency-proxy",
    "gitlab-pages",
    "gitlab-backups",
    "tmp",
  ]
  prefix = var.gitlab["bucket_prefix"]

  set_admin_roles = true
  admins          = ["serviceAccount:${module.gke.service_account}"]
}
