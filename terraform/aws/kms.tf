resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 7
  tags = {
    git_commit           = "e813ae880f7b234b138041860b509629b0f69218"
    git_file             = "terraform/aws/kms.tf"
    git_last_modified_at = "2020-03-28 12:35:15"
    git_last_modified_by = "schosterbarak@gmail.com"
    git_modifiers        = "schosterbarak"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "88717af3-05d1-48f4-a8f7-a120a818f175"
    yor_name             = "logs_key"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
