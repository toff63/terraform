resource "aws_instance" "server" {
    ami = "ami-d85e75b0"
    instance_type = "t1.micro"
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.server.id}"
    depends_on = ["aws_instance.server"]
}
