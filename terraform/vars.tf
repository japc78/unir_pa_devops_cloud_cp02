# Provider
    variable "AZURERM_SUBSCRIPTION_ID" {
    type        = string
    description = "The Azure Subscription ID is required to authenticate with Azure services. You can set it using an environment variable, such as TF_VAR_AZURERM_SUBSCRIPTION_ID, which is commonly used with Terraform. For example, in a Linux terminal, you can define it with: export TF_VAR_AZURERM_SUBSCRIPTION_ID='your-subscription-id'"
  }

# General
  variable "default_location" {
    description = "The default Azure region where resources will be deployed, such as 'West Europe'."
    default = "westeurope"
  }
  variable "prefix" {
    type        = string
    description = "A prefix used for naming all resources. It must be alphanumeric, can include hyphens (-), and must end with a hyphen (-)."
    default     = "prefix-"
  }

  variable "default_tags" {
    description = "A variable defining common tags applied to all resources. These tags help identify and organize resources. The default values are:"
    type        = map(string)
    default = {
      environment = "dev"
      owner       = "my@email.com"
      project     = "My project name"
    }
  }

  variable "base_path" {
    description = "The base directory path for the project, which contains both 'terraform' and 'ansible' folders. This variable is used to define the location where the dynamic Ansible inventory file will be generated, typically under the 'ansible' folder."
    default = "/myproyect"
  }

# ACR
  variable "acr_admin_enable" {
    description = "Enables or disables the admin user for the Azure Container Registry. Set to 'true' by default."
    default = true
  }

  variable "acr_sku" {
    description = "The pricing tier (SKU) for the Azure Container Registry, such as 'Basic', 'Standard', or 'Premium'."
    default = "Basic"
  }

# VM
  variable "vm_size" {
    description = "The size of the virtual machine in Azure, such as 'Standard_B1s'. Defines the compute resources like CPU and memory. Defaults to 'Standard_B1s'."
    default = "Standard_B1s"
  }

  variable "vm_admin_username" {
    description = "The admin username for the virtual machine. The final value is prefixed with the defined prefix (e.g., 'prefix-admin'). Used to log in and manage the VM. Defaults to 'admin'."
    default = "admin"
  }

  variable "vm_os_disk_cachin" {
    description = "The caching mode for the virtual machine's OS disk, such as 'ReadWrite' or 'ReadOnly'. Affects disk performance. Defaults to 'ReadWrite'."
    default = "ReadWrite"
  }

  variable "vm_os_disk_storage_accoung_type" {
    description = "The storage account type for the virtual machine's OS disk, such as 'Standard_LRS' or 'Premium_LRS'. Defines the disk's performance and redundancy. Defaults to 'Standard_LRS'."
    default = "Standard_LRS"
  }

  variable "vm_image_publisher" {
    description = "The publisher of the virtual machine image, such as 'Canonical' for Ubuntu images. Defaults to 'Canonical'."
    default = "Canonical"
  }

  variable "vm_image_offer" {
    description = "The offer name of the virtual machine image, such as '0001-com-ubuntu-server-jammy' for Ubuntu Jammy. Defaults to '0001-com-ubuntu-server-jammy'."
    default = "0001-com-ubuntu-server-jammy"
  }

  variable "vm_image_sku" {
    description = "The SKU of the virtual machine image, such as '22_04-lts' for Ubuntu 22.04 LTS. Defaults to '22_04-lts'."
    default = "22_04-lts"
  }

  variable "vm_image_version" {
    description = "The version of the virtual machine image, such as 'latest' to use the most recent version. Defaults to 'latest'."
    default = "latest"
  }

  variable "vm_pip_dns_name" {
    description = "The DNS name for the virtual machine's public IP. The final value combines this with the defined prefix (e.g., 'prefix-example'). Defaults to 'example'."
    default = "example"
  }


# AKS
  variable "aks_node_pool_name" {
    description = "The name of the node pool in the AKS cluster. Must begin with a lowercase letter, contain only lowercase letters and numbers, and be between 1 and 12 characters in length. Defaults to 'default'."
    default ="default"
  }

  variable "aks_node_pool_node_count" {
    description = "The number of nodes in the AKS node pool. Defines how many virtual machines will run. Defaults to 1."
    default = 1
  }

  variable "aks_node_pool_node_vm_size" {
    description = "The size of the virtual machines in the AKS node pool, such as 'Standard_D2_v2'. Defines the compute resources. Defaults to 'Standard_D2_v2'."
    default = "Standard_D2_v2"
  }

  variable "aks_identity_type" {
    description = "The type of managed identity for the AKS cluster, such as 'SystemAssigned' or 'UserAssigned'. Defaults to 'SystemAssigned'."
    default = "SystemAssigned"
  }

  variable "aks_role_assignment_acr" {
    description = "The role assigned to AKS for accessing the Azure Container Registry, such as 'AcrPull'. Allows pulling images. Defaults to 'AcrPull'."
    default = "AcrPull"
  }
