# data "template_file" "web_install_script"{
#     template = file("./scripts/bootstrap-web.sh")
# }
resource "aws_launch_template" "node-server" {
    name_prefix = "web-"
    image_id = var.AWS_AMI_ID[var.AWS_REGION]
    instance_type = var.AWS_MACHINE_TYPE_WEB
    # vpc_security_group_ids  = [aws_security_group.http-server.id, aws_security_group.ssh-server.id]
    key_name = var.AWS_KEY_PAIR_NAME
    network_interfaces {
      associate_public_ip_address = true
      security_groups = [
        aws_security_group.http-server.id,
        aws_security_group.ssh-server.id
        ]
    }
    user_data = filebase64("./scripts/bootstrap-web.sh")
    monitoring {
        enabled = true
    }
}

resource "aws_autoscaling_group" "web-asg" {
    name = "terraform-web-asg"
    min_size = 1
    desired_capacity = 2
    max_size = 4
    health_check_type = "EC2"
    health_check_grace_period = 20
    target_group_arns = [aws_lb_target_group.web-tg.arn]
    launch_template {
        id = aws_launch_template.node-server.id
        version = "$Latest"
    }
    enabled_metrics = [
        "GroupMinSize",
        "GroupMaxSize",
        "GroupDesiredCapacity",
        "GroupInServiceInstances",
        "GroupTotalInstances"
    ]
    metrics_granularity = "1Minute"
    vpc_zone_identifier = [
        aws_subnet.sim-subnet-private.id,
        aws_subnet.sim-subnet-private-2.id
    ]
    lifecycle {
        create_before_destroy = true
    }
    tag {
        key = "Name"
        value = "web-asg"
        propagate_at_launch = true
    }
    depends_on = [ aws_lb.web-lb ]
}
# Autoscaling group policy for scale up
resource "aws_autoscaling_policy" "web-asg-up" {
    name = "web-asg-up"
    scaling_adjustment = 1
    adjustment_type = "ChangeInCapacity"
    cooldown = 60 #variable
    autoscaling_group_name = aws_autoscaling_group.web-asg.name
}

resource "aws_cloudwatch_metric_alarm" "web-asg-alarm-up" {
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "30"
    statistic = "Average"
    threshold = "50"
    alarm_name = "web-asg-alarm-up"
    alarm_description = "Scale-up if CPU >= 50% for 30s"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.web-asg.name
    }
    alarm_actions = [
        aws_autoscaling_policy.web-asg-up.arn
    ]
}

# Autoscaling group policy for scale down
resource "aws_autoscaling_policy" "web-asg-down" {
    name = "web-asg-down"
    scaling_adjustment = -1
    adjustment_type = "ChangeInCapacity"
    cooldown = 60 #variable
    autoscaling_group_name = aws_autoscaling_group.web-asg.name
}

#cloudwatch alarm for scale down
resource "aws_cloudwatch_metric_alarm" "web-asg-alarm-down" {
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "30"
    statistic = "Average"
    threshold = "20"
    alarm_name = "web-asg-alarm-down"
    alarm_description = "Scale-down if CPU <= 20% for 30s"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.web-asg.name
    }
    alarm_actions = [
        aws_autoscaling_policy.web-asg-down.arn
    ]
}