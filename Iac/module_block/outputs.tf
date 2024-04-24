# this is hello world output comment

output "hello-world" {
  description = "Print a hello world"
  value       = "Hello World"
}
// this is subnet  comment
output "subnet" {
  description = "Output the ID for the subnets"
  value       = module.subnet_addrs.network_cidr_blocks
}
/* this is a multi line comment 
in the terraform */