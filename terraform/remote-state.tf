terraform {
 backend "s3" {
 encrypt = true
 bucket = "kubernetes-state-cluster"
 region = "eu-west-1"
 key = "kubernestescode/terraform.tfstate"
 }
}
