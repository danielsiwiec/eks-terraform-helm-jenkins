resource "helm_release" "kubernetes-dashboard" {
  name  = "kubernetes-dashboard"
  namespace = "kube-system"
  chart = "stable/kubernetes-dashboard"
  depends_on = ["kubernetes_service_account.tiller", "kubernetes_cluster_role_binding.tiller", "null_resource.helm_init"]

  set {
    name = "fullnameOverride"
    value = "kubernetes-dashboard"
  }

  set {
    name = "ingress.enabled"
    value = "true"
  }

  set {
    name = "serviceAccount.name"
    value = "tiller"
  }

  set {
    name = "serviceAccount.create"
    value = "false"
  }

  set {
    name = "rbac.create"
    value = "false"
  }
}