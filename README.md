# EKS-Cluster-Setup-Using-Terraform

**Steps to setup Eks client**
step1:-
launch Ec2 instanc(Eks client) to control the eks master.
Now perform all the below given steps on Newly launched Ec2(Eks client machine) 
step2:- install aws cli
# pip3 install --user -->awscli to install aws cli
# vi .aws/credentials

<give your aws credentials>

# aws --version --> To check aws cli version

**step3:- install eksctl**

# curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp  (Download and extract the latest release of eks file)

# sudo mv /tmp/eksctl /usr/local/bin --> (Move the eks file & extracted binary to /usr/local/bin)

# eksctl version --> (Test that your eksclt installation was successful)

step4:- install kubectl
-------
#  apt-get install -y apt-transport-https --> (To download apt transport https it is used to dowload the files through https)

# curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.14/2023-01-30/bin/linux/amd64/kubectl
note:-
-----
This command is used to download kubectl file we can get this link from kubernetes official webite and also we can select particular available version.

$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl 
$ kubectl version --client

# git clone https://github.com/sssandeep9999/EKS-With-Terraform.git
	
NOW EXECUTE OUR TERRAFORM CODE USING COMMANDS
# terraform init --> To download required dependencies
# terraform plan --> To perform a dryrun
# terraform apply --> To Execute the code ans create infrastructure
# terraform desroy --> To destroy the infrastructure
	
$ aws eks list-clusters
o/p:-
{
    "clusters": [
        "devops-catalog"
    ]
}

step5:-
------
############# Update kubeconfig file in remote machine from cluster using below command ###
 $ aws eks update-kubeconfig --name <cluster-name> --region <region-code>
Ex: aws eks update-kubeconfig --name ashokit_eks --region us-west-1

# aws eks describe-cluster --name devops-catalog -->(To see the cluster information)


root@ip-172-31-47-60:/home/ubuntu# kubectl get nodes 
o/p:-
-----
NAME                                        STATUS   ROLES    AGE   VERSION
ip-10-0-1-242.ap-south-1.compute.internal   Ready    <none>   5m    v1.26.2-eks-a59e1f0

****Now we can perform kubernetes tasks in eks cluster****

# kubectl create -f <give your yaml file> --> To create deployment or service in eks cluster
# kubectl get deploy
# kubectl get svc
# kubecl get pods
# kubectl delete deploy/<deployment name>
# kubectl delete svc/<svc name>	
