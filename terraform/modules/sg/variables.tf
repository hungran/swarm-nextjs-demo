variable "vpc_id" {
    description = "VPC ID to create the security group in"
    type        = string
}

variable "ingress_rules" {
    description = "List of ingress rules for the security group"
    type        = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
}