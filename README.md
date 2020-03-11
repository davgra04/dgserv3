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

Put the following in a .tfvars file:

```bash
# elastic ip to associate instance with
eip_allocation_id = "eipalloc-d3adb33fd3adb33f"

# ip to whitelist for SSH
my_ip = "8.8.8.8"

# server instance size
dgserv_instance_type = "t2.medium"

# key we created above
key_name = "this-is-my-server-key"
private_key_path = "~/.ssh/whatever.key"
public_key_path = "~/.ssh/whatever.key.pub"
```

### Launch Instance

```bash
# Make sure to set the terraform workspace when managing multiple deployments!
cd tf/
terraform workspace select my-space

# init and launch
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

### Notes

## Controlling the docker host from my local machine

```bash
# free socket if previously linked
unlink /tmp/socket.remote

# tunnels /tmp/socket.remote (local) to /var/run/docker.sock (on remote machine)
ssh -i ~/.ssh/whatever.key -nNT -L /tmp/socket.remote:/var/run/docker.sock centos@35.166.158.11 &
export TUNNEL_PID=$!
export DOCKER_HOST=unix:///tmp/socket.remote

# use docker, docker-compose, whatever
docker-compose...

# when finished, shutdown and cleanup of the socket
kill $TUNNEL_PID
rm -f /tmp/socket.remote
```

