resource "aws_instance" "example" {
    ami           = var.ami_id
    instance_type = var.instance_type

    vpc_security_group_ids = var.security_group_ids
    key_name  = var.key_name
    user_data = <<-EOF
                #!/bin/bash

                sudo apt-get update

                sudo apt-get install \
                    ca-certificates \
                    curl \
                    gnupg \
                    lsb-release -y

                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

                echo \
                "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

                sudo apt-get update

                sudo apt-get install docker-ce docker-ce-cli containerd.io git -y


                sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                sudo chmod +x /usr/local/bin/docker-compose

                # sudo chmod 666 /var/run/docker.sock
                sudo usermod -aG docker ubuntu
                # sudo usermod -aG docker $USER

                # Take effect immediately without necessary to logout and login again. Cause the process of the current user and group will be hold.
                # Not neccessary for bootstrap script but left it here for other use.
                newgrp docker
                git clone https://github.com/hungran/swarm-nextjs-demo.git
                cd swarm-nextjs-demo
                docker-compose up -d
                EOF

    tags = {
        Name = "example-instance"
    }
}