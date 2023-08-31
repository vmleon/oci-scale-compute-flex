output "deploy_id" {
  value = random_string.deploy_id.result
}

output "tester_public_ip" {
  value = oci_core_instance.tester.public_ip
}

output "server_public_ip" {
  value = oci_core_instance.server.public_ip
}

output "server_private_ip" {
  value = oci_core_instance.server.private_ip
}
