output "project" {
  value = module.project
}

output "cluster" {
  value     = module.gke
  sensitive = true
}

output "gitlab" {
  value = module.gitlab
}

output "gitlab_ip" {
  value = module.gitlab_ip.addresses
}
