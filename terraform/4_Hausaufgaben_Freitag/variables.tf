variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "eu-central-1"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  default     = "MyDynamoDBTable"
}

variable "read_capacity" {
  description = "Read capacity units for the DynamoDB table"
  default     = 5
}

variable "write_capacity" {
  description = "Write capacity units for the DynamoDB table"
  default     = 5
}

variable "hash_key" {
  description = "Hash key for the DynamoDB table"
  default     = "id"
}

variable "hash_key_type" {
  description = "Hash key type for the DynamoDB table"
  default     = "S"
}