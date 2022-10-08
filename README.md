# Terraform GitLab with GKE AutoPilot

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0, <2.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.38 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.38 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.39.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.1.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_router"></a> [cloud\_router](#module\_cloud\_router) | terraform-google-modules/cloud-router/google | 3.0.0 |
| <a name="module_gcs_buckets"></a> [gcs\_buckets](#module\_gcs\_buckets) | terraform-google-modules/cloud-storage/google | ~> 3.4 |
| <a name="module_gitlab"></a> [gitlab](#module\_gitlab) | terraform-module/release/helm | 2.8.0 |
| <a name="module_gitlab_gcs_connection_sa"></a> [gitlab\_gcs\_connection\_sa](#module\_gitlab\_gcs\_connection\_sa) | terraform-google-modules/service-accounts/google | ~> 4.1 |
| <a name="module_gitlab_ip"></a> [gitlab\_ip](#module\_gitlab\_ip) | terraform-google-modules/address/google | 3.1.1 |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster | ~> 23.1 |
| <a name="module_nat"></a> [nat](#module\_nat) | terraform-google-modules/cloud-nat/google | 2.2.1 |
| <a name="module_project"></a> [project](#module\_project) | terraform-google-modules/project-factory/google | ~> 14.0 |
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | terraform-google-modules/service-accounts/google | ~> 4.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | ~> 5.2 |

## Resources

| Name | Type |
|------|------|
| [google_dns_record_set.kas](https://registry.terraform.io/providers/google/latest/docs/resources/dns_record_set) | resource |
| [google_dns_record_set.minio](https://registry.terraform.io/providers/google/latest/docs/resources/dns_record_set) | resource |
| [google_dns_record_set.registry](https://registry.terraform.io/providers/google/latest/docs/resources/dns_record_set) | resource |
| [kubernetes_namespace.auto](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret_v1.gcs_connection](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.omniauth_gitlab](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.omniauth_google](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [google_billing_account.main](https://registry.terraform.io/providers/google/latest/docs/data-sources/billing_account) | data source |
| [google_client_config.default](https://registry.terraform.io/providers/google/latest/docs/data-sources/client_config) | data source |
| [google_organization.main](https://registry.terraform.io/providers/google/latest/docs/data-sources/organization) | data source |
| [http_http.public_ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Name of the associated BillingAccount | `string` | n/a | yes |
| <a name="input_dns_config"></a> [dns\_config](#input\_dns\_config) | Default configuration for DNS project and configs | <pre>object({<br>    project = string<br>    domain  = string<br>    ttl     = number<br>    type    = string<br>    zone    = string<br>  })</pre> | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID of the folder that this project will reside on in the form: folders/<id> | `string` | `""` | no |
| <a name="input_gitlab"></a> [gitlab](#input\_gitlab) | Set of configurations for GitLab | <pre>object({<br>    domain          = string<br>    cert_email      = string<br>    namespace       = string<br>    version         = string<br>    bucket_prefix   = string<br>    bucket_location = string<br>  })</pre> | n/a | yes |
| <a name="input_gitlab_omni_gitlab"></a> [gitlab\_omni\_gitlab](#input\_gitlab\_omni\_gitlab) | Omniauth Provider configuration for GitLab | <pre>object({<br>    app_id     = string<br>    app_secret = string<br>  })</pre> | <pre>{<br>  "app_id": "",<br>  "app_secret": ""<br>}</pre> | no |
| <a name="input_gitlab_omni_google"></a> [gitlab\_omni\_google](#input\_gitlab\_omni\_google) | Omniauth Provider configuration for Google | <pre>object({<br>    app_id     = string<br>    app_secret = string<br>  })</pre> | <pre>{<br>  "app_id": "",<br>  "app_secret": ""<br>}</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to be applies to the project. Infra-Type label is always applied | <pre>object({<br>    cost-center = string<br>    cost-type   = string<br>    role        = string<br>    team        = string<br>    environment = string<br>  })</pre> | n/a | yes |
| <a name="input_master_authorized_networks_extra_ips"></a> [master\_authorized\_networks\_extra\_ips](#input\_master\_authorized\_networks\_extra\_ips) | List of objects with extra IPs to add to master authorized networks | <pre>list(object({<br>    cidr_block   = string<br>    display_name = string<br>  }))</pre> | `[]` | no |
| <a name="input_namespaces"></a> [namespaces](#input\_namespaces) | List of desired namespaces to be created | `list(string)` | `[]` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Which organization this project belongs to | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Internal custom ID for the project or leave null to generate a random ID | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Display name for the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP region to deploy the cluster to | `string` | `"us-central1"` | no |
| <a name="input_registry_projects"></a> [registry\_projects](#input\_registry\_projects) | List of projects that contain Docker images this cluster might use | `list(string)` | `[]` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | GCP region to deploy the cluster to | `string` | `"us-central1"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | GCP zones to deploy the cluster to | `list(string)` | <pre>[<br>  "us-central1-a",<br>  "us-central1-b",<br>  "us-central1-f"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
| <a name="output_gitlab"></a> [gitlab](#output\_gitlab) | n/a |
| <a name="output_gitlab_ip"></a> [gitlab\_ip](#output\_gitlab\_ip) | n/a |
| <a name="output_project"></a> [project](#output\_project) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
