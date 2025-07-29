resource "aws_instance" "nginx" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"

    provisioner "local-exec" {
        command = "echo Instance ${aws_instance.nginx.public_ip} created!!! > /tmp/instance_state.txt" // if created already use self.public_ip
    }

    provisioner "local-exec" {
      when = destroy
      command = "echo Instance ${aws_instance.nginx.public_ip} destroyed!!! > /tmp/instance_state.txt" 
    }

}

