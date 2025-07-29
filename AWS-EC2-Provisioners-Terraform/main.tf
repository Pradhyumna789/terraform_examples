resource "aws_instance" "nginx" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    tags = {
        Name = "my nginx web server"
    }
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                systemctl enable nginx
                systemctl start nginx
                EOF

    connection {
        type = "ssh"
        host = self.public_ip
        user = "ubuntu"
        private_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCCUaS5zgxQQLtjf59/fB+F5bCnf/nsRmAxNy0R0Fe0j/y7ZT2OEkVeh22MgUvt1WZ7epa9VVgrYw2ALTXbmPNxxE+UFLTVGZ/fGS/yD+Pib3xN6dMY8+XiuZJJo1SLSiG8AU4aRHGza8+O1MZDb5c+zbxi1ZpTW4EEF8wzDlHQBOubFha9+XbigFn9tqTQLquz0f1N70DnHyR3Kg6kf/qvAnFh1Eb6PycWtkCcRaoKL5Ml16klCtf4+wkaJKnYDrgmqWFsZwGbHBXEPFo3U3vmj+OpOc3tEJGthfRaWthPPF3H7bwAvG7foirpvV5W91uJpC2XrDjgenzT6WpaBDQT9OmUl0Hi+/wQfDaF+whrTw/vogg4iQxagXqmOwVi13l14io6S517XNaLawxbqDpuvRDIKeoZv0rrZlwFKR2cwpGONok9+YarfO86HybOxehtvfE9gJeGgH7Yc57eJXamecGvqrA8iP7xH8oFxVEN74XZT1wCngU2uVJ00sDv54r6NKXq2SWxyTKqNFjfk2qVyqgKbfXAEKwDGt/JuxzSi6jL76BKvle+lOLKxoHqRvDSfUSPGb+XonfVYuJKWmAZ+Rxy4YASyk8/s0EjFbVplxF9K3zBOaWXSyQ4w81MEsXbbuCMeIOjVPvlzooa2cdH87Ue3oWqWX6pN49tLh6B3Q== shocker192003@shocker192003-Victus-by-HP-Laptop-16-e0xxx"
    }

    key_name = aws_key_pair.ssh-key.id
    vpc_security_group_ids = [aws_security_group.example.id]
}

resource "aws_key_pair" "ssh-key" {
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCCUaS5zgxQQLtjf59/fB+F5bCnf/nsRmAxNy0R0Fe0j/y7ZT2OEkVeh22MgUvt1WZ7epa9VVgrYw2ALTXbmPNxxE+UFLTVGZ/fGS/yD+Pib3xN6dMY8+XiuZJJo1SLSiG8AU4aRHGza8+O1MZDb5c+zbxi1ZpTW4EEF8wzDlHQBOubFha9+XbigFn9tqTQLquz0f1N70DnHyR3Kg6kf/qvAnFh1Eb6PycWtkCcRaoKL5Ml16klCtf4+wkaJKnYDrgmqWFsZwGbHBXEPFo3U3vmj+OpOc3tEJGthfRaWthPPF3H7bwAvG7foirpvV5W91uJpC2XrDjgenzT6WpaBDQT9OmUl0Hi+/wQfDaF+whrTw/vogg4iQxagXqmOwVi13l14io6S517XNaLawxbqDpuvRDIKeoZv0rrZlwFKR2cwpGONok9+YarfO86HybOxehtvfE9gJeGgH7Yc57eJXamecGvqrA8iP7xH8oFxVEN74XZT1wCngU2uVJ00sDv54r6NKXq2SWxyTKqNFjfk2qVyqgKbfXAEKwDGt/JuxzSi6jL76BKvle+lOLKxoHqRvDSfUSPGb+XonfVYuJKWmAZ+Rxy4YASyk8/s0EjFbVplxF9K3zBOaWXSyQ4w81MEsXbbuCMeIOjVPvlzooa2cdH87Ue3oWqWX6pN49tLh6B3Q== shocker192003@shocker192003-Victus-by-HP-Laptop-16-e0xxx"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "example" {
  name        = "ssh-access"
  description = "allow ssh access from the internet through any source"
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // all ip addresses are allowed to access this server
  }
  vpc_id      = data.aws_vpc.default.id
}

output "public_ip_of_nginx_server" {
    value = aws_instance.nginx.public_ip 
}

