variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode for the table (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "The primary hash key"
  type        = string
}

variable "hash_key_type" {
  description = "The type of the hash key (S, N, B)"
  type        = string
}

variable "range_key" {
  description = "The optional range key"
  type        = string
  default     = ""
}

variable "range_key_type" {
  description = "The type of the range key (S, N, B)"
  type        = string
  default     = "S"
}
