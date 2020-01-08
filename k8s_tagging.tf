locals {
  tags_k8s_values             = var.k8s_clustername != null ? { lower(format("kubernetes.io/cluster/%s", var.k8s_clustername)) = "shared" } : {}
  tags_k8s_role_elb_values    = var.k8s_clustername != null ? { "kubernetes.io/role/elb" = "1" } : {}
}
