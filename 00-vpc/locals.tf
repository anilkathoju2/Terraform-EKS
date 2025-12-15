locals {
   common_tags = {
        project_name = var.project_name
        environment = var.environment
        terraform = true
   }
    common_name_suffix = "${var.project}-${var.environment}"
    az_names = slice(data.aws_availability_zones.available.names, 0, 2 )

}