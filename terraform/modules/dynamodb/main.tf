resource "aws_dynamodb_table" "table" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  dynamic "attribute" {
    for_each = var.range_key != "" ? [1] : []
    content {
      name = var.range_key
      type = var.range_key_type
    }
  }

  tags = {
    Name = var.table_name
  }
}
