resource "random_string" "random" {
  length = 12
}

resource "aws_instance" "webserver" {
    ami = "ami-0986456789aadf"   # Argument
    instance_type = var.instance_type   # Argument with value as expression (Variable value)
}