###Define Application load balancer###
resource "aws_lb" "my_alb" {
  name= "my-alb"
  load_balancer_type = "application"
  subnets = ["var.subnetId1", "var.subnetId2"]
  security_groups = [aws_security_group.alb_sg.id]
  enable_deletion_protection = false
}

###Define Listener###

  resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_lb.my_alb.arn
    port = "80"
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.my_target_group.arn
  }

  }

###Define ALB target group###

resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "var.vpcId"
}

# Define security group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP traffic"
  
  vpc_id = "your-vpc-id"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define EC2 instance
resource "aws_instance" "my_ec2_instance" {
  ami             = "var.amiId"
  instance_type   = "var.instanceType"
  subnet_id       = "var.subnetId1"
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "my-ec2-instance"
  }
}

# Define security group for EC2 instance
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH and HTTP traffic"

  vpc_id = "var.vpcId"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
