provider "aws" {
        region = "us-east-1"
        access_key = "AKIA5TCXGBLPQIQYQOPF"
        secret_key = "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"
}
resource "aws_s3_bucket" "b" {
  bucket = "my-tfff-test-bucket"

  tags = {
    Name        = "My bucket"
}
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}


----------------------------------------------------------
  


provider "aws" {
        region = "us-east-1"
        access_key = "AKIA5TCXGBLPQIQYQOPF"
        secret_key = "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"
}
resource "aws_s3_bucket" "b" {
  bucket = "tfffffbucket"

  tags = {
    Name        = "My bucket"
}
}


