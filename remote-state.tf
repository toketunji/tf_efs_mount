terraform {
 backend "s3" {
 encrypt = true
 bucket = "kube007-clusters"
 region = "eu-west-1"
 key = "kubernestescode/terraform.tfstate"
 }
}
