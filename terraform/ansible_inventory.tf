resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/ansible_inventory.tftpl",
    {
      tester_public_ip = oci_core_instance.tester.public_ip
      server_public_ip = oci_core_instance.server.public_ip
    }
  )
  filename = "${path.module}/generated/app.ini"
}
