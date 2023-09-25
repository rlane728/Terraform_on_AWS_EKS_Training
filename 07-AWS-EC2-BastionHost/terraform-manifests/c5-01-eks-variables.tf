# EKS Cluster Input Variables
# Referenced in c2-02-local-values.tf
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eksdemo"
}