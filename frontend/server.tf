resource "aws_instance" "server" {
    ami = "ami-d85e75b0"
    instance_type = "t1.micro"
    
    count = 3
    user_data = "${file("./frontend/user-data.sh")}"

    tags {
	Name = "frontend"
    }
} 

output "instances" {
	value = ["${aws_instance.server.*.id}"]
}

