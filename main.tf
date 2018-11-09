terraform {
	backend "atlas" {
		name = "jb-testing/test2"
	}
}

data "terraform_remote_state" "tls_private_key" {
	  backend = "atlas"
		config {
			    name = "jb-testing/test3"
					  
		}

}
provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

resource "acme_registration" "reg" {
  account_key_pem = "${data.terraform_remote_state.tls_private_key.private_key.private_key_pem}"
	email_address   = "jbarnes7952@gmail.com"
}

