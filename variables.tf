variable "region" {
    description = "region"
    type = string
    default = "us-west-2"  
}

variable "source_bucket" {
    description = "source bucket"
    type = string
    default = "rmr-source-bucket"  
}

variable "destination_bucket" {
    description = "destination bucket"
    type = string
    default = "rmr-destination-bucket"  
}

variable "lambda_movefiles" {
    description = "lambda to move s3 files"
    type = string
    default = "lambda-movefiles"  
}