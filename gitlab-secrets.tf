resource "kubernetes_secret_v1" "gcs_connection" {
  metadata {
    name      = "gitlab-gcs-connection"
    namespace = var.gitlab["namespace"]
  }

  data = {
    connection = yamlencode({
      provider       = "Google"
      google_project = module.project.project_id

      google_json_key_string = module.gitlab_gcs_connection_sa.key
    })
  }

  type = "Opaque"
}

resource "kubernetes_secret_v1" "runner_gcs_connection" {
  metadata {
    name      = "google-application-credentials"
    namespace = var.gitlab["namespace"]
  }

  data = {
    "gcs-application-credentials-file" = module.gitlab_gcs_connection_sa.key
  }

  type = "Opaque"
}

resource "kubernetes_secret_v1" "registry_gcs" {
  metadata {
    name      = "gitlab-registry-config"
    namespace = var.gitlab["namespace"]
  }

  data = {
    "config" = yamlencode({
      gcs = {
        bucket  = "${var.gitlab["bucket_prefix"]}-${lower(var.gitlab["bucket_location"])}-gitlab-registry"
        keyfile = "/etc/docker/registry/storage/keyfile"
      }
    })
    "keyfile" = module.gitlab_gcs_connection_sa.key
  }

  type = "Opaque"
}

resource "kubernetes_secret_v1" "omniauth_google" {
  metadata {
    name      = "gitlab-omni-provider-google"
    namespace = var.gitlab["namespace"]
  }

  data = {
    provider = yamlencode({
      name  = "google_oauth2"
      label = "Google"

      app_id     = var.gitlab_omni_google["app_id"]
      app_secret = var.gitlab_omni_google["app_secret"]

      args = {
        access_type     = "offline"
        approval_prompt = ""
      }
    })
  }

  type = "Opaque"
}

resource "kubernetes_secret_v1" "omniauth_gitlab" {
  metadata {
    name      = "gitlab-omni-provider-gitlab"
    namespace = var.gitlab["namespace"]
  }

  data = {
    provider = yamlencode({
      name  = "gitlab"
      label = "Gitlab"

      app_id     = var.gitlab_omni_gitlab["app_id"]
      app_secret = var.gitlab_omni_gitlab["app_secret"]

      args = {
        scope = "read_user"
      }
    })
  }

  type = "Opaque"
}
