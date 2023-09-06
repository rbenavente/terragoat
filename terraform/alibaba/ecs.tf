variable "name" {
  default = "auto_provisioning_group"
}

# Create a new ECS instance for a VPC
resource "alicloud_security_group" "group" {
  name        = "tf_test_foo"
  description = "foo"
  vpc_id      = alicloud_vpc.vpc.id
  tags = {
    git_commit           = "160ec5d93cbb125b02c39c92c3369d2ecc26107f"
    git_file             = "terraform/alibaba/ecs.tf"
    git_last_modified_at = "2022-07-01 17:03:39"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "1ba6e2ed-7567-4b18-8f01-42560d6a6b2c"
    yor_name             = "group"
  }
}

resource "alicloud_kms_key" "key" {
  description            = "Hello KMS"
  pending_window_in_days = "7"
  key_state              = "Enabled"
  tags = {
    git_commit           = "160ec5d93cbb125b02c39c92c3369d2ecc26107f"
    git_file             = "terraform/alibaba/ecs.tf"
    git_last_modified_at = "2022-07-01 17:03:39"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_name             = "key"
    yor_trace            = "ab272634-e93d-43d2-8a5f-09f1d991356a"
  }
}

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

# Create a new ECS instance for VPC
resource "alicloud_vpc" "vpc" {
  name       = var.name
  cidr_block = "172.16.0.0/16"
  tags = {
    git_commit           = "160ec5d93cbb125b02c39c92c3369d2ecc26107f"
    git_file             = "terraform/alibaba/ecs.tf"
    git_last_modified_at = "2022-07-01 17:03:39"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "19f1dd69-af98-459f-bd48-e7f021ebe328"
    yor_name             = "vpc"
  }
}

resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = var.name
  tags = {
    git_commit           = "160ec5d93cbb125b02c39c92c3369d2ecc26107f"
    git_file             = "terraform/alibaba/ecs.tf"
    git_last_modified_at = "2022-07-01 17:03:39"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "3bb095c0-622e-4ae3-bd43-665dedc487ad"
    yor_name             = "vswitch"
  }
}

resource "alicloud_slb_load_balancer" "slb" {
  load_balancer_name = "test-slb-tf"
  vswitch_id         = alicloud_vswitch.vswitch.id
  tags = {
    git_commit           = "160ec5d93cbb125b02c39c92c3369d2ecc26107f"
    git_file             = "terraform/alibaba/ecs.tf"
    git_last_modified_at = "2022-07-01 17:03:39"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "494d90ac-0fc8-4b74-b3a2-14d847a33703"
    yor_name             = "slb"
  }
}

resource "alicloud_instance" "instance" {
  # cn-beijing
  availability_zone = "cn-beijing-b"
  security_groups   = alicloud_security_group.group.*.id

  # series III
  instance_type              = "ecs.n4.large"
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "test_foo_system_disk_name"
  system_disk_description    = "test_foo_system_disk_description"
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = "test_foo"
  vswitch_id                 = alicloud_vswitch.vswitch.id
  internet_max_bandwidth_out = 10
  data_disks {
    name        = "disk2"
    size        = 20
    category    = "cloud_efficiency"
    description = "disk2"
    encrypted   = true
    kms_key_id  = alicloud_kms_key.key.id
  }
  tags = {
    git_commit           = "160ec5d93cbb125b02c39c92c3369d2ecc26107f"
    git_file             = "terraform/alibaba/ecs.tf"
    git_last_modified_at = "2022-07-01 17:03:39"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "002128aa-6ee6-47df-974b-4e0d734e0144"
    yor_name             = "instance"
  }
}
