terraform {
	backend "atlas" {
		name = "jb-testing/test2"
	}
}


provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = "${tls_private_key.private_key.private_key_pem}"
	email_address   = "jbarnes7952@gmail.com"
}

