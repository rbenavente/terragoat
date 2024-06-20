resource aws_ecr_repository "repository" {
  name                 = "${local.resource_prefix.value}-repository"
  image_tag_mutability = "MUTABLE"


  tags = {
    Name                 = "${local.resource_prefix.value}-repository"
    git_commit           = "20eecc36a3804ef1c8f986299efef099af90f88e"
    git_file             = "terraform/aws/ecr.tf"
    git_last_modified_at = "2022-02-11 19:53:38"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente/nimrodkor"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "398733fe-8aa9-453c-b719-7b5958f8bb4b"
    yor_name             = "repository"
  }
}

locals {
  docker_image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com/${aws_ecr_repository.repository.name}"
}


resource null_resource "push_image" {
  provisioner "local-exec" {
    working_dir = "${path.module}/resources"
    command     = <<BASH
    aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com
    docker build -t ${aws_ecr_repository.repository.name} .
    docker tag ${aws_ecr_repository.repository.name} ${local.docker_image}
    docker push ${local.docker_image}
    BASH
  }
}
