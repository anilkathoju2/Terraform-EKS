variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_name" {
    default = [
        # databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # backend
        # "catalogue", "user", "cart", "shipping", "payment",
        # frontend
        # "frontend",
        # bastion
        "bastion",
        # frontend load balancer
        "ingress_alb",
        # Backend ALB
        # "backend_alb"
    ]
}

variable "sg_tags" {
    type = map
    default = {}
}

variable "sg_description" {
    type = string
    default = ""
}

variable "vpc_id" {
    default = {}
}