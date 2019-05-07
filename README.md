# eks-terraform-helm-jenkins
A terraform setup for AWS EKS with Jenkins, using Helm.

## Prerequisites
- terraform >0.11.13

## Instructions
- `terraform init`
- `terraform plan`
- `terraform apply`

Due to [this](https://github.com/hashicorp/terraform/issues/2430) issue, the first run might fail with a timeout. If it does, simply rerun `terraform apply`.


- Copy kubeconfig_jenkins-eks to ~/.kube/config

## Jenkins

### URL

`kubectl get svc -o wide`

Port: `8080`

### Credentials
User: `admin`

Password:
```
kubectl get secret --namespace default jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode
```

## Kubernetes dashboard

By default, the dashboard is not exposed through an external IP. To access it, run `kubectl proxy` in order to open a localhost proxy.

### URL
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:https/proxy/

### Token

`aws-iam-authenticator token -i jenkins-eks --token-only`
