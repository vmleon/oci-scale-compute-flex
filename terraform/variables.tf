variable "tenancy_ocid" {
  type = string
}

variable "region" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "ssh_public_key_path" {
  type = string
}

variable "instance_shape" {
  type    = string
  default = "VM.Standard.E4.Flex"
}
