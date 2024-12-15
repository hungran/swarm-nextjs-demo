variable "security_group_ids" {
    description = "List of security group IDs to associate with the EC2 instance"
    type        = list(string)
}

variable "instance_type" {
    description = "Type of the EC2 instance"
    type        = string
    default     = "t2.micro"
}

variable "ami_id" {
    description = "AMI ID to use for the EC2 instance"
    type        = string
}
