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
