variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_service" {
  description = "The AWS service that assumes this role"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = ""
}

variable "policy_document" {
  description = "IAM policy document as a JSON object"
  type        = any
}
