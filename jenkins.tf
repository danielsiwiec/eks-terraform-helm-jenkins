resource "helm_release" "jenkins" {
  name  = "jenkins"
  chart = "stable/jenkins"
  depends_on = ["kubernetes_service_account.tiller", "kubernetes_cluster_role_binding.tiller", "null_resource.helm_init"]
}