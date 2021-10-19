resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 7
  tags = {
    yor_trace = "2ea917d7-465c-4890-a823-93b18582854e"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
