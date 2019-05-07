resource "helm_release" "kubernetes-dashboard" {
  name      = "kubernetes-dashboard"
  namespace = "kube-system"
  chart     = "stable/kubernetes-dashboard"

  set {
    name  = "fullnameOverride"
    value = "kubernetes-dashboard"
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "tiller"
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "rbac.create"
    value = "false"
  }
}
