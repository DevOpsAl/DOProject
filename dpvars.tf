variable "myregion" {
  type  = string
  description  = "us-east-1"
}

variable "secret_key" {
  sensitive  = true
  type  = string
  description  = "Your AWs IAM Secret Key"
}

variable "access_key" {
  sensitive  = true
  type  = string
  description  = "Your AWs IAM access Key"
}

variable "vpcname" {
  default  = "dpvpc1"
}