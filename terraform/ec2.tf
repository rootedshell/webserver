# webserver instance
resource "aws_instance" "webserver" {
  ami                    = "ami-0360c520857e3138f"  # ubuntu
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = "rajesh"
  associate_public_ip_address = true

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "webserver"
  }
}


## elastic ip
resource "aws_eip" "web_eip" {
  tags = {
    Name = "webserver"
  }
}

## elastic ip associate
resource "aws_eip_association" "web_eip_assoc" {
  instance_id   = aws_instance.webserver.id
  allocation_id = aws_eip.web_eip.id
}
