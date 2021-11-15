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
    git_commit           = "1f626f72c4e4055276e6ac5b2e984be2a9bdb25d"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-15 11:41:31"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "2e96ca80-c88f-4b7f-b2cc-c28bb11c913c"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "1f626f72c4e4055276e6ac5b2e984be2a9bdb25d"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-15 11:41:31"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "390d6fbf-2da4-4728-9c97-44f8b58867f9"
  }
  associate_public_ip_address = true
  availability_zone = "us-west-2a"
  cpu_core_count = "1"
  cpu_threads_per_core = "1"
  credit_specification = {"cpu_credits": "standard"}
  disable_api_termination = false
  ebs_optimized = false
  get_password_data = false
  hibernation = false
  ipv6_address_count = "0"
  metadata_options = {"http_endpoint": "enabled", "http_put_response_hop_limit": "1", "http_tokens": "optional"}
  monitoring = false
  private_ip = "172.31.19.31"
  root_block_device = {"delete_on_termination": true, "encrypted": false, "iops": "100", "volume_size": "8", "volume_type": "gp2"}
  source_dest_check = true
  subnet_id = "subnet-589d4220"
  tenancy = "default"
  vpc_security_group_ids = ["sg-0ce2783fe123b2073"]
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
