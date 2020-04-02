variable "namespace" {
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
  type        = map(string)
  default     = {}
}

variable "group_name_prefix" {
  description = "Prefix of IAM group name"
  type        = string
  default     = ""
}

variable "group_name_suffix" {
  description = "Suffix of IAM group name"
  type        = string
  default     = ""
}

variable "group_assumable_roles" {
  description = "Map of IAM roles ARNs which can be assumed by the group"
  type        = map(any)
  default     = {}
}

variable "assumable_role_create" {
  description = "Whether to create a role"
  type        = bool
  default     = true
}

variable "assumable_role_name" {
  description = "IAM role name. Defaults to auto generated role name"
  type        = string
  default     = ""
}

variable "assumable_role_name_generated" {
  description = "IAM role name. Defaults to auto generated role name"
  type        = bool
  default     = false
}

variable "assumable_role_path" {
  description = "IAM role path"
  type        = string
  default     = "/"
}

variable "assumable_role_mfa" {
  description = "Whether role requires MFA"
  type        = bool
  default     = true
}

variable "assumable_role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = ""
}

variable "assumable_role_trusted_arns" {
  description = "ARNs of AWS entities who can assume these roles"
  type        = list(string)
  default     = []
}

variable "assumable_role_services" {
  description = "AWS Services that can assume these roles	"
  type        = list(string)
  default     = []
}

variable "assumable_role_attach_admin_policy" {
  description = "Whether to attach an admin policy to a role"
  type        = bool
  default     = false
}

variable "assumable_admin_role_policy_arn" {
  description = "Policy ARN to use for admin role"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "assumable_additional_role_policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  default     = []
}

variable "assumable_tags" {
  description = "A map of tags to add to IAM role resources"
  type        = map(string)
  default     = {}
}
