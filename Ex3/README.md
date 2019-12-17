Launch instance in public subnet with public ip and check nginx running

## Generate ssh key in a directory ##
ssh-keygen -t rsa -b 4096 -C "<email-id>" -f <file-path-and-name-to-pvt-ssh-key>

## Variables on the Command Line ##
*** public subnets should have 0.0.0.0/0 route and instance should have public ip ***
terraform apply -var="SUBNET_ID=<public-subnet-id>" -var="AWS_ACCESS_KEY=<aws-public-access-key>" -var="AWS_SECRET_KEY=<aws-private-secret-key>"

terraform destroy -var="SUBNET_ID=<public-subnet-id>" -var="AWS_ACCESS_KEY=<aws-public-access-key>" -var="AWS_SECRET_KEY=<aws-private-secret-key>"

## ssh and check if nginx is running? ##
ssh -i "mykey" ubuntu@<private-ip>
curl -LI http://localhost

## on browser ##
http://<public-ip>