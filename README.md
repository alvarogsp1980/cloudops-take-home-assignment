# **Static Website to Azure Storage with Terraform**

## Overview

### Target Audience
|Audience |Purpose  |
|--|--|
| Copperleaf automation team | Understand the Design and steps to build their copperleaf home test |

### Description
>This terraforming artifact provides the ability to implement the static website requested by copperleaf to assess Álvaro García's knowledge.

>For the deployment of the infrastructure where the static website will be hosted, the terraform code and an Azure Storage account have been used.

>This artifact includes the terraform code needed to implement the infrastructure and copy the provided binaries for the static website.

> For this example, the terraform outputs show you the URL of the client's website completely online:

https://copperleafsta.z6.web.core.windows.net/

## **Prerrequisites & Dependencies**

The following requirements given by candidate must be provided before the deployment can take place:

- Terraform cli version ([download here](https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_windows_amd64.zip)). You can use other tools with Terraform cli (i.e: Terraform Cloud/ Enterprise, Azure Devops, Ansible or Jenkins). In this example I use 1.1.9 for Windows. 
- Azure Subscription.
- Azure Active Directory (AAD) Service Principal Name (SPN) with contributor role to create all required resources in the previous subscription. You can create this SPN follow this [Terraform instructions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret).

### Version

See [changelog.md](CHANGELOG.md)

## **Usage**

>For the deployment of the infrastructure via terraform cli (in this example CI/CD tools such as Azure Devops, Jenkins or similar are not taken into account) you must take into account that a mixture of variables is used: sensitive and non-sensitive.

>- For non-sensitive variables, you can use a .tfvars file like the one provided in this repository, but with real data.

>- For sensitive variables, it is not recommended to include them in this .tfvars or plain text file, therefore, it is advisable to execute the following sequence of commands, once you have completed your own .tfvars file.

```hcl
# Initialize terraform code
terraform init

# Plan your deployment
terraform plan -var="subscription_id=00000000-0000-0000-0000-000000000000" -var="tenant_id=00000000-0000-0000-0000-000000000000" -var="client_id=00000000-0000-0000-0000-000000000000"  -var="client_secret=00000000-0000-0000-0000-000000000000"  -var-file="example.tfvars"

# Apply your deployment
terraform apply -var="subscription_id=00000000-0000-0000-0000-000000000000" -var="tenant_id=00000000-0000-0000-0000-000000000000" -var="client_id=00000000-0000-0000-0000-000000000000"  -var="client_secret=00000000-0000-0000-0000-000000000000"  -var-file="example.tfvars"

# When you want destroy all infrastructure
terraform destroy -var="subscription_id=00000000-0000-0000-0000-000000000000" -var="tenant_id=00000000-0000-0000-0000-000000000000" -var="client_id=00000000-0000-0000-0000-000000000000"  -var="client_secret=00000000-0000-0000-0000-000000000000"  -var-file="example.tfvars"
```
You can view more details about [copperleaf home test configuration parameters](variables.tf).

### Variables & Configuration

- **Required variable list**

| Name | Default Value | Type | Mandatory | Others |
|:--|:--:|:--:|:--:|:--|
| subscription_id | n/a | String | yes | (Required) The ID of the Subscription in which the resources are to be created. |
| tenant_id | n/a | String | yes | (Required) The ID of the Tenant to which the subscription belongs. |
| client_id | n/a | String | yes | (Required) The client ID of the service principal that will create the resources. |
| client_secret | n/a | String | yes | (Required) The client Secret of the service principal that will create the resources. |
| resource_group | n/a | String | yes | (Required) The name of the resource group in which to create the resources. Changing this forces a new resource to be created. |
| sta_name | n/a | String | yes | (Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group. |
| sta_static_website_index_document | n/a | String | yes | (Required) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive. |
| sta_blobs | n/a | Map | yes | (Required) One or more blocks to defined each blob content |

- **Optional variable list**

| Name | Default Value | Type |Mandatory |Others |
|:--|:--:|:--:|:--:|:--|
| location | "" | string | no | (Optional) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. |
| sta_account_kind | "StorageV2" | string | no | (Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to StorageV2. |
| sta_account_tier | "Standard" | string | no | (Optional) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. |
| sta_account_replication_type | "LRS" | string | no |(Optional) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa. |
| sta_enable_https_traffic_only | true | bool | no |(Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true |
| tags | {} | map | no | (Optional) User and common Tags. |

You can view more details about [copperleaf home test configuration parameters](variables.tf).

## Outputs list

| Name| Output value | Description
|:--|:--|:--|
|website_url | azurerm_storage_account.sta.primary_web_endpoint |The endpoint URL for web storage in the primary location. |

You can view more details about [copperleaf home test configuration outputs](outputs.tf).

#### Package content

This section explain the structure and elements that represent the artifacts of product.

|Folder|Name|Description
|--|:-|--|
| ./webcontent | * | Web site content to deploy into Azure infrastructure |
| Root | README.md | Product documentation file |
| Root | CHANGELOG.md | Artifact change log file |
| Root | main.tf | Terraform file to deploy infrastructure |
| Root | providers.tf | Terraform file to define backend and providers for the artifact |
| Root | outputs.tf | Terraform file to use and check in other pipeline |
| Root | variables.tf | Terraform file to use in pipeline to configure product |
| Root | versions.tf | Terraform file to define versions of Terraform and others |
| Root | example.tfvars | Terraform vars file like example to deploy infrastructure |