resource "aws_ssm_parameter" "sg_id" {
  count = length(var.sg_name)
  name  = "/${var.project_name}/${var.environment}/${var.sg_name[count.index]}_sg_id"
  type  = "String"
  value = aws_security_group.roboshop[count.index].id

}

