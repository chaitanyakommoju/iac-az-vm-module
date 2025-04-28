output "vm_id" {
  value = azurerm_virtual_machine.this.id
}

output "vm_name" {
  description = "Name of the Virtual Machine"
  value       = azurerm_virtual_machine.this.name
}

output "vm_size" {
  description = "Size (SKU) of the Virtual Machine"
  value       = azurerm_virtual_machine.this.vm_size
}

output "os_offer" {
  description = "OS offer used to create the VM (like UbuntuServer)"
  value       = tolist(azurerm_virtual_machine.this.storage_image_reference)[0].offer
}

output "os_disk_size_gb" {
  description = "OS Disk Size in GB"
  value       = tolist(azurerm_virtual_machine.this.storage_os_disk)[0].disk_size_gb
}
