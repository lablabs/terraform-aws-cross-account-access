locals {
  assumable_role_create = var.assumable_role_create && length(var.assumable_role_trusted_arns) + length(var.assumable_role_services) > 0 ? true : false
}

data "aws_iam_policy_document" "assumable_role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.assumable_role_trusted_arns
    }

    principals {
      type        = "Service"
      identifiers = var.assumable_role_services
    }
  }
}

data "aws_iam_policy_document" "assumable_role_with_mfa" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.assumable_role_trusted_arns
    }

    principals {
      type        = "Service"
      identifiers = var.assumable_role_services
    }

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

resource "aws_iam_role" "assumable_role" {
  count = local.assumable_role_create ? 1 : 0

  name                 = var.assumable_role_name_generated ? module.role_label.id : var.assumable_role_name
  path                 = var.assumable_role_path
  permissions_boundary = var.assumable_role_permissions_boundary_arn
  assume_role_policy   = var.assumable_role_mfa ? data.aws_iam_policy_document.assumable_role_with_mfa.json : data.aws_iam_policy_document.assumable_role.json
  tags                 = module.role_label.tags
}

resource "aws_iam_role_policy_attachment" "assumable_role_additional" {
  count = local.assumable_role_create ? length(var.assumable_additional_role_policy_arns) : 0

  role       = aws_iam_role.assumable_role[0].name
  policy_arn = var.assumable_additional_role_policy_arns[count.index]
}

resource "aws_iam_role_policy_attachment" "assumable_role_admin" {
  count = local.assumable_role_create && var.assumable_role_attach_admin_policy ? 1 : 0

  role       = aws_iam_role.assumable_role[0].name
  policy_arn = var.assumable_admin_role_policy_arn
}