########################
# VARIABLE DECLARATION #
########################

#Basic connection information
#variable "access_key"           {}  
#variable "secret_key"           {} 
variable "region"               { default  = "eu-west-1" } 
variable "azs"                  { default = { "eu-west-1"  = "a,b"} }


#Network

variable "vpc_cidr"             { default = "10.0.0.0/22" }
variable "subnet_bits"          { default = "2" }


# Remote state
variable "state_bucket_name"    { default = "prod31082017" }

#TAG variables
variable "owner" {
  default = "OLU"
}

variable "environ"  {
  default = "PROD"
}

variable "app_name" {
  default = "JENKINS_PIPELINE"
}

variable "key_name"     {
  default = "JenkinsKey"
}


##Jenkins varibles

variable "jenkins_user" {
  default = "ags-tech-user"
}


variable "jenkins_password" {
  default = "ags-tech-pass"
}
