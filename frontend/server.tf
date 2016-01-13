resource "aws_instance" "server" {
    ami = "ami-d85e75b0"
    instance_type = "t1.micro"
}
