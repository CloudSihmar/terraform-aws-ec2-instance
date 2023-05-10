resource "aws_instance" "ec2_example" {

    ami = "ami-0a695f0d95cefc163"
    instance_type = "t2.micro"
    key_name = "terraform"
    security_groups = [var.security-group]
    subnet_id = var.subnet
    associate_public_ip_address = true

  user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update -u
      sudo apt install -y nginx
      sudo systemctl start nginx
      sudo echo "<html><body><h1>Hello this is module-1 at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF
}


