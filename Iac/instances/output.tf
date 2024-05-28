output "region" {
  value = data.aws_region.current.name
}
output "availability"{
  value = data.aws_availability_zone.Az.zone_id
}

output "ami-id" {
  description = "This is the AMI id to use"  
  value = data.aws_ami_ids.ubuntu.ids[0]
}
output "key-pair"{
    description = "This is the key name"
    value = data.aws_key_pair.existing-key.key_name
}
output "vpc-id"{
    description = "This is the vpc id"
    value = data.aws_vpc.selected
}
output "subnets"{
  value = data.aws_subnets.subnets-ids.ids
}

output "securitygroup-id" {
  description = "Security group id"
  value = data.aws_security_groups.ansible-sg.ids
}
