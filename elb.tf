# Create a new load balancer
resource "aws_elb" "app" {
  name = "app-terraform-elb"
  availability_zones = ["us-east-1d", "us-east-1b", "us-east-1c"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  instances = ["${module.frontend.instances}"]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "app-terraform-elb"
  }
}
