

module "group_label" {
  source      = "cloudposse/label/null"
  version     = "0.24.1"
  namespace   = var.namespace
  environment = var.environment
  tags        = var.tags
}

module "role_label" {
  source      = "cloudposse/label/null"
  version     = "0.24.1"
  namespace   = var.namespace
  environment = var.environment
  name        = var.assumable_role_name
  tags        = var.tags
}
