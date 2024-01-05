# Providers configuration
# These providers depend on the output of the respectives modules declared below.
# However, for clarity and ease of maintenance we grouped them all together in this section.

provider "kubernetes" {
  host                   = module.kind.parsed_kubeconfig.host
  client_certificate     = module.kind.parsed_kubeconfig.client_certificate
  client_key             = module.kind.parsed_kubeconfig.client_key
  cluster_ca_certificate = module.kind.parsed_kubeconfig.cluster_ca_certificate
}

# Module declarations and configuration

module "kind" {
  source = "./modules/kind"
  cluster_name       = "kind"
  kubernetes_version = "v1.29.0"
}

