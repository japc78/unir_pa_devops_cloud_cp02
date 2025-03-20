resource "tls_private_key" "vm_ssh_key" {
	algorithm = "RSA"
	rsa_bits = 4096
}