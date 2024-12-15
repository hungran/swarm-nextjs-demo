provider "aws" {
  region  = "ap-southeast-1"
  profile = "hungran"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = "vpc-07e5a769b8a18601c" #TODO: You must change to your vpc_id from your account
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 3000
      to_port     = 30000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ec2" {
  source             = "./modules/ec2"
  ami_id             = "ami-06650ca7ed78ff6fa"
  instance_type      = "t3.medium"
  security_group_ids = [module.sg.security_group_id]
}

output "ip" {
  value = module.ec2.nextjs_ip
}