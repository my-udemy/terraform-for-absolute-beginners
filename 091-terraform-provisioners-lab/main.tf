
# Create a EC2 instance from an image
resource "aws_instance" "cerberus" {
  ami           = "ami-0182f373e66f89c85"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.cerberus-key.id
  user_data     = file("./install-nginx.sh")
}

# Creating a default ssh key to enable communication with the EC2 instance
resource "aws_key_pair" "cerberus-key" {
  key_name   = "cerberus"
  public_key = file(".ssh/cerberus.pub")
}

# Creating a resource to provide a static public ip to the EC2 instance
resource "aws_eip" "eip" {
  vpc      = true
  instance = aws_instance.cerberus.id
  provisioner "local-exec" {
    command = "echo ${aws_eip.eip.public_dns} >> /root/cerberus_public_dns.txt"
  }
}
