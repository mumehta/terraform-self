variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "ap-southeast-2"
}

variable "AMIS" {
  type = map(string)
  default = {
        us-east-1 = "ami-0400a1104d5b9caa1"
        us-west-2 = "ami-0fc025e3171c5a1bf"
        eu-west-1 = "ami-035df3cfe31bdea3b"
        ap-southeast-2 = "ami-00a54827eb7ffcd3c"
  }
}

variable "SUBNET_ID" {
  default = "subnet-621cc03b"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}