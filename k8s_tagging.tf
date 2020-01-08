locals {
  tags_k8s_values             = length(var.k8s_clustername) > 0 ? { lower(format("kubernetes.io/cluster/%s", var.k8s_clustername)) = "shared" } : ""
  tags_k8s_role_elb_values    = length(var.tags_k8s_role_elb) > 0 ? { lower("kubernetes.io/role/elb") = "1" } : ""
}
