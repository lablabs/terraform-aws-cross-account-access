

module "group_label" {
  source      = "lablabs/label/null"
  version     = "0.16.0"
  namespace   = var.namespace
  environment = var.environment
  tags        = var.tags
}

module "role_label" {
  source      = "lablabs/label/null"
  version     = "0.16.0"
  namespace   = var.namespace
  environment = var.environment
  name        = var.assumable_role_name
  tags        = var.tags
}
