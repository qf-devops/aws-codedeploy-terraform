# create an S3 bucket
resource "aws_s3_bucket" "b" {
  bucket = "codedeploydemo-${random_integer.suffix.result}"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "random_integer" "suffix" {
  min = 100
  max = 999
}
