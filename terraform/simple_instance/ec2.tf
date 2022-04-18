provider "aws" {
  region = "eu-central-1"
}
resource "aws_security_group" "ssh_traffic" {

  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    git_commit           = "85d660f4464c62e4dc321579fe142750a43e7c73"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-04-18 14:50:53"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "1fea1b20-ec93-46fe-8e7a-485a1b6fbef2"
  }
}

resource "aws_instance" "web_server_instance" {

  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]


  tags = {
    git_commit           = "85d660f4464c62e4dc321579fe142750a43e7c73"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-04-18 14:50:53"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "2b790d6d-94b8-42d0-a6c4-4953d67d593c"
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
