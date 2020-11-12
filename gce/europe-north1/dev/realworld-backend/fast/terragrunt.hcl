# include is a block, so make sure NOT to include an equals sign
include {
  path = find_in_parent_folders()
}


terraform {
  source = "git@github.com:mikaellive202011/devops-realworld-example-backend.git//terraform/backend?ref=6692f5dcfa6d2268923bdfbb44a72ce7fb62d898"
}


dependency "kubernetes" {
  config_path = "../../common/kubernetes"
}

inputs = {
  kubernetes_host                   = dependency.kubernetes.outputs.endpoint
  kubernetes_client_key             = dependency.kubernetes.outputs.client_key
  kubernetes_client_certificate     = dependency.kubernetes.outputs.client_certificate
  kubernetes_cluster_ca_certificate = dependency.kubernetes.outputs.cluster_ca_certificate
  pod_scale                         = 1
  ext_database                      = false
}
