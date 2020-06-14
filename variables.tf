variable "app_name" {
  type        = string
  description = "Name of the app to create an RDS instance for"
}

variable "environment" {
  type        = string
  description = "Infrastructure environment, e.g. staging or production"
  default     = "staging"
}

variable "stack" {
  type        = string
  description = "Name to differentiate applications deployed in the same infrastructure environment"
  default     = ""
}

variable "subnet_group_name" {
    type    = string
    default = "db_subnet_group"
}

variable "allocated_storage" {


}

variable "db_engine" {


}

variable "db_engine_version" {


}

variable "db_instance_class" {


}

variable "db_name" {


}

variable "db_username" {


}

variable "vpc_security_group_ids" {
    type = list(string)
}

variable "snapshot_identifier" {
  type        = string
  default     = ""
}