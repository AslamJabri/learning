variable "vpc_cidr" {
  description = "CIDR for the VPC"
  type = string
  default = "10.10.0.0/20"
}
variable "sub_cidr" {
    description = "CIDR block for subnet"
    type = string
    default = "10.10.0.0/24"
}
variable "availability_zone" {
    description = "In which AZ"
    type = string
    default = "ap-south-1a"
}