resource "aws_ssm_parameter" "password" {
  name        = "/${var.environment}/${var.app_name}/${local.stack}/DB_PASSWORD"
  description = "db password"
  type        = "SecureString"
  value       = "${random_password.random_db_password.result}"
  overwrite   = "true"
  tags = {
    environment = "${var.environment}"
  }
}

resource "aws_ssm_parameter" "host" {
  name        = "/${var.environment}/${var.app_name}/${local.stack}/DB_HOST"
  description = "db host"
  type        = "SecureString"
  value       = "${aws_db_instance.db.address}"
  overwrite   = "true"

  tags = {
    environment = "${var.environment}"
  }
}

resource "aws_ssm_parameter" "name" {
  name        = "/${var.environment}/${var.app_name}/${local.stack}/DB_NAME"
  description = "db name"
  type        = "SecureString"
  value       = "${aws_db_instance.db.name}"
  overwrite   = "true"

  tags = {
    environment = "${var.environment}"
  }
}

resource "aws_ssm_parameter" "username" {
  name        = "/${var.environment}/${var.app_name}/${local.stack}/DB_USERNAME"
  description = "db username"
  type        = "SecureString"
  value       = "${aws_db_instance.db.username}"
  overwrite   = "true"

  tags = {
    environment = "${var.environment}"
  }
}