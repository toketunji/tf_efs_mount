resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = "kube007-clusters"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags {
      Name = "Kubernetes Terraform State Store"
    }
}
provider "aws" {
   region     = "eu-west-1"
}
