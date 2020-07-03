locals {
  assume_policy_name = "${module.group_label.id}-%s"
  assume_group_name  = "${module.group_label.id}-${var.group_name_prefix}%s${var.group_name_suffix}"
}

data "aws_iam_policy_document" "assume_role" {
  for_each = var.group_account_role

  statement {
    sid       = format("AllowAssumeRoleFor%sAccount", each.key)
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = [each.value]
  }
}

resource "aws_iam_policy" "assume_role" {
  for_each = var.group_account_role

  name        = format(local.assume_policy_name, each.key)
  description = format("Allows to assume role in %s AWS account", each.key)
  policy      = data.aws_iam_policy_document.assume_role[each.key].json
}

resource "aws_iam_group" "assume_role" {
  for_each = var.group_account_role

  name = format(local.assume_group_name, each.key)
}

resource "aws_iam_group_policy_attachment" "assume_role" {
  for_each = var.group_account_role

  group      = aws_iam_group.assume_role[each.key].id
  policy_arn = aws_iam_policy.assume_role[each.key].arn
}
