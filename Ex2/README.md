## Generate ssh key in a directory ##
ssh-keygen -t rsa -b 4096 -C "<email-id>" -f <file-path-and-name-to-pvt-ssh-key>

## Variables on the Command Line ##
*** private subnets should have 0.0.0.0/0 route via nat gateway ***
terraform apply -var="SUBNET_ID=<private-subnet-id>" -var="AWS_ACCESS_KEY=<aws-public-access-key>" -var="AWS_SECRET_KEY=<aws-private-secret-key>"

terraform destroy -var="SUBNET_ID=<private-subnet-id>" -var="AWS_ACCESS_KEY=<aws-public-access-key>" -var="AWS_SECRET_KEY=<aws-private-secret-key>"

## ssh and check if nginx is running? ##
ssh -i "mykey" ubuntu@<private-ip>
curl -LI http://localhost