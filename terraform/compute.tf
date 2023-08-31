locals {
  instance_ocpus         = 1
  instance_memory_in_gbs = 8
}

resource "oci_core_instance" "tester" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "tester_${random_string.deploy_id.result}"
  shape               = var.instance_shape

  metadata = {
    ssh_authorized_keys = chomp(file(var.ssh_public_key_path))
  }

  shape_config {
    ocpus         = local.instance_ocpus
    memory_in_gbs = local.instance_memory_in_gbs
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.publicsubnet.id
    display_name              = "tester"
    assign_public_ip          = true
    assign_private_dns_record = true
    hostname_label            = "tester"
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.ol8_images.images[0].id
  }

  timeouts {
    create = "60m"
  }
}

resource "oci_core_instance" "server" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "server_${random_string.deploy_id.result}"
  shape               = var.instance_shape

  metadata = {
    ssh_authorized_keys = chomp(file(var.ssh_public_key_path))
  }

  shape_config {
    ocpus         = local.instance_ocpus
    memory_in_gbs = local.instance_memory_in_gbs
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.publicsubnet.id
    display_name              = "server"
    assign_public_ip          = true
    assign_private_dns_record = true
    hostname_label            = "server"
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.ol8_images.images[0].id
  }

  timeouts {
    create = "60m"
  }
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [oci_core_instance.tester, oci_core_instance.server]

  create_duration = "30s"
}
