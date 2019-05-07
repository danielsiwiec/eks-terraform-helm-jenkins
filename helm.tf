locals {
  service_account = "tiller"
  service_account_namespace = "kube-system"
}

provider "kubernetes" {
  config_path = "${module.eks.kubeconfig_filename}"
}

resource "kubernetes_service_account" "tiller" {
  metadata {
    name      = "${local.service_account}"
    namespace = "${local.service_account_namespace}"
  }

  automount_service_account_token = true
} 

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "${local.service_account}"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    api_group = ""
    kind      = "ServiceAccount"
    name      = "${local.service_account}"
    namespace = "${local.service_account_namespace}"
  }
}

provider "helm" {
  service_account = "${local.service_account}"
  namespace       = "${local.service_account_namespace}"

  kubernetes {
    config_path = "${module.eks.kubeconfig_filename}"
  }
}