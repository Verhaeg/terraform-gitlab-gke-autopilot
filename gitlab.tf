module "gitlab" {
  source  = "terraform-module/release/helm"
  version = "2.8.0"

  namespace  = var.gitlab["namespace"]
  repository = "https://charts.gitlab.io/"

  app = {
    name          = "gitlab"
    version       = var.gitlab["version"]
    chart         = "gitlab"
    force_update  = false
    wait          = false
    recreate_pods = false
    deploy        = 1
  }

  set = [
    {
      name  = "global.hosts.domain",
      value = var.gitlab["domain"]
    },
    {
      name  = "global.hosts.externalIP",
      value = module.gitlab_ip.addresses[0]
    },
    {
      name  = "global.kas.enabled",
      value = true
    },
    {
      name  = "global.minio.enabled",
      value = false
    },
    {
      name  = "certmanager.global.leaderElection.namespace",
      value = var.gitlab["namespace"]
    },
    {
      name  = "certmanager-issuer.email",
      value = var.gitlab["cert_email"]
    },
    # Resources minimum for Autopilot
    {
      name  = "registry.resources.requests.memory",
      value = "512Mi"
    },
    {
      name  = "registry.init.resources.requests.memory",
      value = "512Mi"
    },
    {
      name  = "gitlab.gitlab-exporter.resources.requests.memory",
      value = "512Mi"
    },
    {
      name  = "gitlab.gitaly.resources.requests.memory",
      value = "512Mi"
    },
    {
      name  = "gitlab.kas.resources.requests.memory",
      value = "512Mi"
    },
    {
      name  = "gitlab.toolbox.resources.requests.memory",
      value = "512Mi"
    },
    {
      name  = "gitlab.migrations.resources.requests.memory",
      value = "1Gi"
    },
    {
      name  = "gitlab.webservice.resources.requests.cpu",
      value = "600m"
    },
  ]

  values = [
    yamlencode({
      global = {
        appConfig = yamldecode(templatefile("config/appConfig.yml", {
          gcs_connection_secret  = kubernetes_secret_v1.gcs_connection.metadata[0].name,
          bucket_prefix          = "${var.gitlab["bucket_prefix"]}-${lower(var.gitlab["bucket_location"])}",
          omniauth_google_secret = kubernetes_secret_v1.omniauth_google.metadata[0].name,
          omniauth_gitlab_secret = kubernetes_secret_v1.omniauth_gitlab.metadata[0].name,
        }))
        registry = {
          bucket = "${var.gitlab["bucket_prefix"]}-${lower(var.gitlab["bucket_location"])}-gitlab-registry"
        }
      }
      gitlab-runner = {
        concurrent = var.gitlab_runner["concurrent"],
        logFormat  = "json",
        runners = {
          config = yamldecode(yamlencode(templatefile("config/runners.toml", {
            cache_type   = var.gitlab_runner["cache_type"],
            cache_bucket = var.gitlab_runner["cache_bucket"],
          })))
          cache = {
            secretName = kubernetes_secret_v1.runner_gcs_connection.metadata[0].name
          }
          tags        = join(",", var.gitlab_runner["tags"])
          runUntagged = var.gitlab_runner["runUntagged"]
        }
        secrets = [
          {
            name = kubernetes_secret_v1.runner_gcs_connection.metadata[0].name
          }
        ]
      }
      registry = {
        storage = {
          secret   = kubernetes_secret_v1.registry_gcs.metadata[0].name
          key      = "config"
          extraKey = "keyfile"
        }
      }
    }),
  ]
}
