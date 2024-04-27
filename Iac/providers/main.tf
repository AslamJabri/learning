resource "tls_private_key" "generate" {
  algorithm = "RSA"
}
resource "local_file" "private_key_pem" {
  content  = tls_private_key.generate.private_key_pem
  filename = "terra.pem"
}
output "generate" {
  value = tls_private_key.generate
  sensitive = true
}