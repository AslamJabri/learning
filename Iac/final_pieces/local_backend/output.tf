output "region" {
  value = data.aws_region.current.id
}
output "az" {
  description = "Availability zones"
  value       = data.aws_availability_zones.available
}
output "s3_bucket" {
  value = aws_s3_bucket.terra_auth.id
}
output "vpcid" {
  value = data.aws_vpc.default.id
}
output "public-Ip" {
  value = aws_instance.ubuntu-server.public_ip
}
output "ami-id" {
  description = "ami-id"
  value       = data.aws_ami.web-server.id
}
