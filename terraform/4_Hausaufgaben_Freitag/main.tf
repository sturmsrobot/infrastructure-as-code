resource "aws_dynamodb_table" "my_table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  tags = {
    Name        = var.dynamodb_table_name
    Environment = "Development"
  }
}