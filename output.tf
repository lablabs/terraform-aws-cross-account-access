output "group_names" {
  value = [
    for group in aws_iam_group.assume_role :
    group.name
  ]
}

output "group_ids" {
  value = [
    for group in aws_iam_group.assume_role :
    group.id
  ]
}

output "group_arns" {
  value = [
    for group in aws_iam_group.assume_role :
    group.arn
  ]
}

output "group_policy_arns" {
  value = {
    for group, attachment in aws_iam_group_policy_attachment.assume_role :
    attachment.group => attachment.policy_arn
  }
}

output "assumable_role_name" {
  value = element(concat(aws_iam_role.assumable_role.*.name, [""]), 0)
}

output "assumable_role_id" {
  value = element(concat(aws_iam_role.assumable_role.*.id, [""]), 0)
}

output "assumable_role_arn" {
  value = element(concat(aws_iam_role.assumable_role.*.arn, [""]), 0)
}

output "assumable_role_admin_policy" {
  value = var.assumable_admin_role_policy_arn
}

output "assumable_role_additional_policy" {
  value = [
    for policy in aws_iam_role_policy_attachment.assumable_role_additional :
    policy.policy_arn
  ]
}