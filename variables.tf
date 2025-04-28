variable "vm_name" {
  description = "The name of the Virtual Machine."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the Network Interface associated with the VM."
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "storage_os_disk" {
  description = "OS disk configuration."
  type = object({
    name              = string
    caching           = string
    create_option     = string
    managed_disk_type = string
  })
}

variable "storage_image_reference" {
  description = "Image reference for the VM."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "os_profile" {
  description = "OS profile settings."
  type = object({
    admin_username = string
    admin_password = string
  })
}

variable "tags" {
  description = "Tags for the VM."
  type        = map(string)
}
