variable "AWS_REGION" {
  default = "ap-southeast-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
    ap-southeast-2 = "ami-00a54827eb7ffcd3c"    
  }
}

variable "SUBNET_ID" {
}

