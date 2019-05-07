resource "helm_release" "jenkins" {
  name  = "jenkins"
  chart = "stable/jenkins"
}
