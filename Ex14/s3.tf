resource "aws_s3_bucket" "b" {
  bucket = "mubucket-c29df1"
  acl    = "private"

  tags = {
    Name = "mubucket-c29df1"
  }
}

