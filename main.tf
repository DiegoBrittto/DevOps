provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "calculadora" {
  bucket = "calculadora-html-site-123456" # nome global único

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Name = "CalculadoraSite"
  }
}

resource "aws_s3_bucket_public_access_block" "no_block" {
  bucket = aws_s3_bucket.calculadora.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.calculadora.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.calculadora.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.no_block]
}
