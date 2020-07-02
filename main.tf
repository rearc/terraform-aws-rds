locals {
  stack = var.stack != "" ? var.stack : var.environment
}

resource "random_password" "random_db_password" {
  length = 30
  special = true
  override_special = "!#$%&_"
}

resource "random_id" "identifier" {
  byte_length = 2
}

resource "random_id" "final_snapshot_id" {
  byte_length = 4
}

resource "aws_db_instance" "db" {
  identifier             = replace("${local.stack}-${var.app_name}-${random_id.identifier.hex}", "_", "")
  snapshot_identifier    = var.snapshot_identifier
  allocated_storage      = var.snapshot_identifier != "" ? null : var.allocated_storage
  storage_type           = "gp2"
  engine                 = var.snapshot_identifier != "" ? null : "${var.db_engine}"
  engine_version         = var.snapshot_identifier != "" ? null : "${var.db_engine_version}"
  instance_class         = "${var.db_instance_class}"
  name                   = var.snapshot_identifier != "" ? null : "${var.db_name}"
  username               = var.snapshot_identifier != "" ? null : "${var.db_username}"
  password               = "${aws_ssm_parameter.password.value}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  db_subnet_group_name   = "${var.subnet_group_name}"

  final_snapshot_identifier = "A${random_id.final_snapshot_id.hex}"
}
