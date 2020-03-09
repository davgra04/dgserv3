dgserv3
=======

dgserv3 is a Terraform project for managing personal websites in AWS. Sites are hosted as docker containers on an EC2 instance serving as the docker host.




## Setting Up

### Manually Create Elastic IP

Create an Elastic IP through the AWS UI, and configure the domain DNS settings with an A Record pointing to it.

### Create a New Key

```bash
# generate key for accessing EC2 instance
ssh-keygen -t rsa -C this-is-my-server-key -f ~/.ssh/whatever.key
```

### Create .tfvars File

TODO

### Launch Instance

```bash
cd tf/
terraform init
terraform apply -var-file="deployment_20191031.tfvars" --auto-approve
```

### Build Docker Image

```bash
ssh -i ~/.ssh/whatever.key centos@my_ip
cd dgserv3/heyo_world/
docker build -t heyo-world .

```

### Deploy Docker Container


```bash
docker run -t -i -p 80:80 heyo-world
```


