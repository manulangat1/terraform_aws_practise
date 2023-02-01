provider "aws" {

    # region = "us-west-2"
    region = var.region
  
}

variable "region" {

    description = "This is the regio in which the s3 bucket shuld be created"
    default = "us-west-2"  
}

variable "environment" {

    description = "This is the current environment"

    default = "dev"
  
}

resource "aws_s3_bucket_acl" "my-acl" {
    acl =  "public-read"
    bucket = aws_s3_bucket.my_s3.id
  
}

resource "aws_s3_bucket" "my_s3" {

    bucket = "${var.environment}-bucket-gh"

    tags = {
        "Name" = "my-${var.environment}-bucket-fghj"
        "env" = var.environment
    }

    
    # acl = "public-read"
  
}

output "my_s3_details" {

    value = aws_s3_bucket.my_s3.bucket
  
}