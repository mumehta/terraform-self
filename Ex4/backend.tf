terraform {
    backend s3 {
        bucket = "aws-terraform-s3-experimental"
        key = "terraform/ex4"
    }
}