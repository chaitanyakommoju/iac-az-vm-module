# iac-az-vm-module
## `azurerm_virtual_machine` Resource

This resource creates an Azure Virtual Machine.

### Arguments

- **name**: The name of the virtual machine.
- **location**: The Azure region where the virtual machine will be deployed.
- **resource_group_name**: The name of the resource group in which the virtual machine will reside.
- **network_interface_ids**: A list of IDs for the network interfaces to associate with the virtual machine.
- **vm_size**: The size of the virtual machine (e.g., Standard_DS1_v2, Standard_B1ms).

### Disk Settings

- **delete_os_disk_on_termination**: Set to `true` to delete the OS disk when the VM is terminated.
- **delete_data_disks_on_termination**: Set to `true` to delete data disks when the VM is terminated.

### OS Disk Configuration

- **storage_os_disk**: Configures the OS disk for the VM.
  - **name**: The name of the OS disk.
  - **caching**: The caching behavior of the OS disk (e.g., ReadWrite, ReadOnly).
  - **create_option**: The create option for the OS disk (e.g., FromImage).
  - **managed_disk_type**: The type of managed disk (e.g., Standard_LRS, Premium_LRS).

### Image Reference

- **storage_image_reference**: The image reference for the VM.
  - **publisher**: The publisher of the image (e.g., Canonical).
  - **offer**: The offer for the image (e.g., UbuntuServer).
  - **sku**: The SKU for the image (e.g., 18.04-LTS).
  - **version**: The version of the image (e.g., latest).

### OS Profile

- **os_profile**: The OS profile for the virtual machine.
  - **computer_name**: The computer name for the VM.
  - **admin_username**: The admin username for the VM.
  - **admin_password**: The admin password for the VM.

### OS Profile Linux Configuration

- **os_profile_linux_config**: Configuration for Linux VMs.
  - **disable_password_authentication**: Set to `true` to disable password authentication (SSH keys will be used instead).

### Tags

- **tags**: Tags applied to the virtual machine resource for resource management.

### Example Usage

```hcl
resource "azurerm_virtual_machine" "this" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_id]
  vm_size               = var.vm_size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_os_disk {
    name              = var.storage_os_disk.name
    caching           = var.storage_os_disk.caching
    create_option     = var.storage_os_disk.create_option
    managed_disk_type = var.storage_os_disk.managed_disk_type
  }

  storage_image_reference {
    publisher = var.storage_image_reference.publisher
    offer     = var.storage_image_reference.offer
    sku       = var.storage_image_reference.sku
    version   = var.storage_image_reference.version
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.os_profile.admin_username
    admin_password = var.os_profile.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = true
  }

  tags = var.tags
}
