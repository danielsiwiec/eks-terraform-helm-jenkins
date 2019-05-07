Copy kubeconfig_jenkins-eks to ~/.kube/config

# Jenkins

Get url:
kubectl get svc -o wide

Port 8080

User admin

Password:
kubectl get secret --namespace default jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode

# Kubernetes dashboard

aws-iam-authenticator token -i jenkins-eks --token-only

kubectl proxy

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:https/proxy/