resource "aws_key_pair" "mykey" {
  key_name  = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE
  subnet_id     = var.SUBNET_ID
  key_name      = aws_key_pair.mykey.key_name
  associate_public_ip_address = true

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline    = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  provisioner "local-exec" {
    command =  <<EOT
      echo Public ip ${aws_instance.example.public_ip} >> ips.txt;
      echo Private ip ${aws_instance.example.private_ip} >> ips.txt
    EOT
  }

  connection {
    host    = coalesce(self.public_ip, self.private_ip)
    type    = "ssh"
    user    = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}