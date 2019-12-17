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
    command = "echo ${aws_instance.example.public_ip} >> public_ips.txt"
  }

  connection {
    host    = coalesce(self.public_ip, self.private_ip)
    type    = "ssh"
    user    = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}