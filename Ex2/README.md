## Generate ssh key in a directory ##
ssh-keygen -t rsa -b 4096 -C "<email-id>" -f <file-path-and-name-to-pvt-ssh-key>

## Variables on the Command Line ##
terraform apply -var="SUBNET_ID=<public-subnet-id>" -var="AWS_ACCESS_KEY=<aws-public-access-key>" -var="AWS_SECRET_KEY=<aws-private-secret-key>"