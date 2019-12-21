terraform {
    backend s3 {
        bucket = "aws-terra-s3-experimental"
        key = "terraform/ex7"
        profile = "personal"
        region = "ap-southeast-2"
    }
}