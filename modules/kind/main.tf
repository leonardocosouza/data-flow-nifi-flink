resource "kind_cluster" "cluster" {
  name = "kind"
  node_image = "kindest/node:${var.kubernetes_version}"
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"


    node {
      role = "control-plane"
    }
    /*dynamic "node" {
      for_each = var.control_plane
      content {
        role   = "control-plane"
        labels = node.value
      }
    }*/

    dynamic "node" {
      for_each = var.nodes
      content {
        role   = "worker"
        labels = node.value
      }
    }
  }
}

data "docker_network" "kind" {
  name       = var.cluster_name
  depends_on = [kind_cluster.cluster]
}

