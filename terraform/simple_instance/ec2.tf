provider "aws" {
  region = "us-west-2"
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
    git_commit           = "ec9924e7cfd06d92c5ca48c518f1021a850a0857"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-15 11:16:25"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "e067649f-8b76-4e09-8bbe-2345ccff18d9"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "ec9924e7cfd06d92c5ca48c518f1021a850a0857"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-15 11:16:25"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "09303c30-5ccd-4eb8-8dab-32b90fd9721c"
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
