variable "vm_name" {}
variable "vm_type" {}
variable "zone" {}
variable "subnet" {}
variable "tags" {
  type    = list(string)
  default = []
}
