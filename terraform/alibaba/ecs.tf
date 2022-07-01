data "alicloud_images" "ubuntu" {
  most_recent = true
  name_regex  = "^ubuntu_18.*64"
}

module "ecs_cluster" {
  source = "alibaba/ecs-instance/alicloud"

  number_of_instances = 5

  name                        = "my-ecs-cluster"
  use_num_suffix              = true
  image_id                    = data.alicloud_images.ubuntu.ids.0
  instance_type               = "ecs.sn1ne.large"
  vswitch_id                  = "vsw-fhuqie"
  security_group_ids          = ["sg-12345678"]
  associate_public_ip_address = true
  internet_max_bandwidth_out  = 10

  key_name = "for-ecs-cluster"

  system_disk_category = "cloud_ssd"
  system_disk_size     = 50

  tags = {
    Created              = "Terraform"
    Environment          = "dev"
    git_commit           = "2ceb6bc34b43a5b078bf8c6ec64964c10aca8d18"
    git_file             = "terraform/alibaba/ecs.tf"
    git_last_modified_at = "2022-07-01 16:41:41"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "72ad16b3-55a3-4493-814f-2cf0a8277f28"
  }
}
