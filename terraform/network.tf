resource "oci_core_virtual_network" "vcn_scale" {
  compartment_id = var.compartment_ocid
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "Scale VCN ${random_string.deploy_id.result}"
  dns_label      = "scale"
}

resource "oci_core_internet_gateway" "internet_gateway_scale" {
  compartment_id = var.compartment_ocid
  display_name   = "InternetGateway"
  vcn_id         = oci_core_virtual_network.vcn_scale.id
}

resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_virtual_network.vcn_scale.default_route_table_id
  display_name               = "DefaultRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway_scale.id
  }
}

resource "oci_core_subnet" "publicsubnet" {
  cidr_block        = "10.0.0.0/24"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn_scale.id
  display_name      = "public subnet"
  dns_label         = "public"
  security_list_ids = [oci_core_virtual_network.vcn_scale.default_security_list_id]
  route_table_id    = oci_core_virtual_network.vcn_scale.default_route_table_id
  dhcp_options_id   = oci_core_virtual_network.vcn_scale.default_dhcp_options_id
}

resource "oci_core_subnet" "privatesubnet" {
  cidr_block                 = "10.0.1.0/24"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_virtual_network.vcn_scale.id
  display_name               = "private subnet"
  dns_label                  = "private"
  prohibit_public_ip_on_vnic = true
  security_list_ids          = [oci_core_virtual_network.vcn_scale.default_security_list_id, oci_core_security_list.app_security_list.id]
  route_table_id             = oci_core_virtual_network.vcn_scale.default_route_table_id
  dhcp_options_id            = oci_core_virtual_network.vcn_scale.default_dhcp_options_id
}

resource "oci_core_security_list" "app_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn_scale.id
  display_name   = "App Security List"

  ingress_security_rules {
    protocol  = "6" // tcp
    source    = oci_core_virtual_network.vcn_scale.cidr_block
    stateless = false

    tcp_options {
      min = 3000
      max = 3000
    }
  }

}
