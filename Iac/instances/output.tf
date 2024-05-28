output "region" {
  value = data.aws_region.current.name
}
output "ami-id" {
  description = "This is the AMI id to use"  
  value = data.aws_ami_ids.ubuntu.id
}
output "key-pair"{
    description = "This is the key name"
    value = data.aws_key_pair.existing-key.key_name
}
output "vpc-id"{
    description = "This is the vpc id"
    value = data.aws_vpc.selected.id
}
output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnet-loop : s.cidr_block]
}