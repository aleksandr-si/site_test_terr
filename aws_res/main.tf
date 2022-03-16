provider "aws" {
    access_key = ""
    secret_key = ""
    region = "eu-central-1"
    alias = "GER"
}
provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-1"
    alias = "USA"
}
provider "aws" {
    access_key = ""
    secret_key = ""
    region = "eu-west-2"
    alias = "GB"
}
#=================================================================================

data "aws_region" "current_usa" {
    provider = aws.USA
}

data "aws_region" "current_ger" {
    provider = aws.GER
}

data "aws_region" "current_gb" {
    provider = aws.GB
}


#=================================================================================

data "aws_ami" "latest_amazon_linux_usa" {
  provider = aws.USA
  owners = [ "137112412989" ]
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}


resource "aws_instance" "test_serv_usa" {
    count = 1
    provider = aws.USA
    ami = "${data.aws_ami.latest_amazon_linux_usa.id}"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver_usa.id]
    user_data = templatefile("user_data.sh", {
        current_zone = data.aws_region.current_usa.name
        City = "N.Virginia"
    })
    tags = {
        Name = data.aws_region.current_usa.name
        
    }
}


resource "aws_security_group" "my_webserver_usa" {
  provider = aws.USA
  name        = "my_web_serv_security_group"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}

#=================================================================================




data "aws_ami" "latest_amazon_linux_ger" {
  provider = aws.GER
  owners = [ "137112412989" ]
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}


resource "aws_instance" "test_serv_ger" {
    count = 1
    provider = aws.GER
    ami = "${data.aws_ami.latest_amazon_linux_ger.id}"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver_ger.id]
    user_data = templatefile("user_data.sh", {
        current_zone = data.aws_region.current_ger.name
        City = "Frankfurt"
    })
    tags = {
        Name = data.aws_region.current_ger.name
        
    }
}


resource "aws_security_group" "my_webserver_ger" {
  provider = aws.GER
  name        = "my_web_serv_security_group"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}
#=================================================================================


data "aws_ami" "latest_amazon_linux_gb" {
  provider = aws.GB
  owners = [ "137112412989" ]
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}


resource "aws_instance" "test_serv_gb" {
    count = 1
    provider = aws.GB
    ami = "${data.aws_ami.latest_amazon_linux_gb.id}"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver_gb.id]
    user_data = templatefile("user_data.sh", {
        current_zone = data.aws_region.current_gb.name,
        City = "London"
    })
    tags = {
        Name = data.aws_region.current_gb.name
    }
}


resource "aws_security_group" "my_webserver_gb" {
  provider = aws.GB
  name        = "my_web_serv_security_group"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}
