resource "aws_instance" "mi_instancia" {
  ami           = "ami-0c94855ba95c574c8" # Este es un ID de AMI de ejemplo para Amazon Linux 2
  instance_type = "t3a.micro"

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "mi_instancia"
  }
}

resource "aws_eip" "mi_eip" {
  instance = aws_instance.mi_instancia.id
  vpc      = true
}

resource "aws_alb" "mi_alb" {
  name               = "mi-alb"
  subnets            = ["subnet-abcde012", "subnet-bcde012a"] # sustituir por tus IDs de subred
  security_groups    = ["sg-abcde0123"] # sustituir por tu ID de grupo de seguridad
}

resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = aws_alb.mi_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_alb_listener" "listener_https" {
  load_balancer_arn = aws_alb.mi_alb.arn
  port              = "443"
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::123456789012:certificate/test" #sustituir por tu ARN de certificado

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.mi_tg.arn
  }
}

resource "aws_alb_listener_rule" "limit_ip" {
  listener_arn = aws_alb_listener.listener_https.arn
  priority     = 100

  condition {
    field  = "source-ip"
    values = ["192.0.2.0/32"] # sustituir por tu rango de IP
  }

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.mi_tg.arn
  }
}

resource "aws_alb_listener_rule" "limit_post" {
  listener_arn = aws_alb_listener.listener_https.arn
  priority     = 200

  condition {
    field  = "http-request-method"
    values = ["POST"]
  }

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.mi_tg.arn
  }
}

resource "aws_alb_target_group" "mi_tg" {
  name     = "mi-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-abcde012" # Sustituye por tu ID de VPC

  health_check {
    enabled = true
    path    = "/"
    port    = "traffic-port"
    protocol = "HTTP"
  }
}
