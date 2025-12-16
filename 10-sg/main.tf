resource "aws_security_group" "roboshop" {
  count       = length(var.sg_name)
  name        = var.sg_name[count.index]
  #description = "Created for ${var.sg_name[count.index]}"
  vpc_id      = local.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.sg_tags,
    local.common_tags,
    {
      Name        = "${local.common_name_suffix}-${var.sg_name[count.index]}"
      Project     = var.project_name
      Environment = var.environment
    }
  )
}



# Frontend accepting traffic from frontend ALB
# resource "aws_security_group_rule" "frontend_frontend_alb" {
#   type              = "ingress"
#   security_group_id = module.sg[9].sg_id # frontend SG ID
#   source_security_group_id = module.sg[11].sg_id # frontend ALB SG ID
#   from_port         = 80
#   protocol          = "tcp"
#   to_port           = 80
# }