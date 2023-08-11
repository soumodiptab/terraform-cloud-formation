resource "aws_lb" "web-lb" {
    name = "terraform-web-lb"
    load_balancer_type = "application"
    internal = false
    enable_cross_zone_load_balancing = true
    security_groups = [
        aws_security_group.http-server.id,
        aws_security_group.ssh-server.id
    ]
    subnets = [
      aws_subnet.sim-subnet-public.id,
      aws_subnet.sim-subnet-public-2.id
      ]
    tags = {
        Name = "web-lb"
    }
}
resource "aws_lb_listener" "web-lb-listener" {
  load_balancer_arn = aws_lb.web-lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web-tg.arn
  }
}

resource "aws_lb_target_group" "web-tg" {
    name = "terraform-web-tg"
    target_type = "instance"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.sim-vpc.id
    health_check {
      path = "/"
      port = "80"
      protocol = "HTTP"
      healthy_threshold = 2
      unhealthy_threshold = 2
      timeout = 5
      interval = 10
    }
}