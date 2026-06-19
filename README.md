# EKS Cluster Setup Using Terraform

## Overview

This project provisions a complete Amazon EKS (Elastic Kubernetes Service) cluster on AWS using Terraform.

The infrastructure includes:

* VPC
* Public and Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* EKS Control Plane
* EKS Managed Node Group
* IAM Roles and Policies
* Security Groups

Once the infrastructure is created, Kubernetes workloads can be deployed using `kubectl`.

---

## Architecture

Terraform → AWS Infrastructure → EKS Cluster → Worker Nodes → Kubernetes Applications

### AWS Resources Created

* VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* EKS Cluster
* EKS Node Group
* IAM Roles
* Security Groups

---

## Prerequisites

Before deploying the EKS cluster, ensure the following tools are installed:

### AWS CLI

```bash
pip3 install --user awscli

aws --version
```

Configure AWS credentials:

```bash
mkdir -p ~/.aws

vi ~/.aws/credentials
```

Example:

```ini
[default]
aws_access_key_id=YOUR_ACCESS_KEY
aws_secret_access_key=YOUR_SECRET_KEY
region=ap-south-1
```

---

### Install eksctl

```bash
curl --silent --location \
"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" \
| tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin
```

Verify installation:

```bash
eksctl version
```

---

### Install kubectl

```bash
sudo apt-get update

sudo apt-get install -y apt-transport-https

curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.14/2023-01-30/bin/linux/amd64/kubectl

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

Verify installation:

```bash
kubectl version --client
```

---

### Install Terraform

```bash
terraform version
```

If Terraform is not installed, install it from the official HashiCorp repository.

---

## Clone Repository

```bash
git clone https://github.com/sssandeep9999/EKS-With-Terraform.git

cd EKS-With-Terraform
```

---

## Deploy Infrastructure

### Initialize Terraform

Downloads required providers and modules.

```bash
terraform init
```

### Review Execution Plan

```bash
terraform plan
```

### Create Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when prompted.

---

## Verify EKS Cluster

List available clusters:

```bash
aws eks list-clusters
```

Example Output:

```json
{
  "clusters": [
    "devops-catalog"
  ]
}
```

Describe cluster:

```bash
aws eks describe-cluster \
--name devops-catalog
```

---

## Configure kubectl

Update kubeconfig file:

```bash
aws eks update-kubeconfig \
--name devops-catalog \
--region ap-south-1
```

Verify node status:

```bash
kubectl get nodes
```

Example:

```text
NAME                                          STATUS   ROLES    AGE
ip-10-0-1-242.ap-south-1.compute.internal     Ready    <none>   5m
```

---

## Deploy Kubernetes Workloads

Create resources:

```bash
kubectl apply -f deployment.yaml

kubectl apply -f service.yaml
```

Check deployments:

```bash
kubectl get deploy
```

Check services:

```bash
kubectl get svc
```

Check pods:

```bash
kubectl get pods
```

Delete resources:

```bash
kubectl delete deploy <deployment-name>

kubectl delete svc <service-name>
```

---

## Destroy Infrastructure

To remove all AWS resources created by Terraform:

```bash
terraform destroy
```

Type:

```text
yes
```

when prompted.

---

## Project Structure

```text
EKS-With-Terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
│
├── modules/
│   ├── vpc/
│   ├── eks/
│   └── iam/
│
└── README.md
```

---

## Skills Demonstrated

* Terraform Modules
* Infrastructure as Code (IaC)
* AWS EKS
* VPC Networking
* IAM Roles & Policies
* Kubernetes Administration
* kubectl
* AWS CLI
* DevOps Automation

---

## Author

**Satya Sandeep**

GitHub: https://github.com/sssandeep9999

---

## License

This project is intended for learning and demonstration purposes.

