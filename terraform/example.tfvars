# Required and Optional variables to create Azure Resource Group
resource_group = "copperleafrg"
location       = "West Europe"
tags = {
product     = "Static Website"
description = "copperleaf home test"
}

# Required and Optional variables to create Azure Storage Account
sta_name                          = "copperleafsta"
sta_static_website_index_document = "default.htm"

# Required and Optional variables to create Azure Storage Account blob
sta_blobs = {
    blob01 = {
        sta_blob_name              = "default.htm"
        sta_storage_container_name = "$web"
        sta_blob_type              = "Block"
        sta_blob_content_type      = "text/html"
        sta_blob_source            = "../websitefiles/default.htm"
    }
    blob02 = {
        sta_blob_name              = "logo.jpg"
        sta_storage_container_name = "$web"
        sta_blob_type              = "Block"
        sta_blob_content_type      = "text/html"
        sta_blob_source            = "../websitefiles/logo.jpg"
    }
}
