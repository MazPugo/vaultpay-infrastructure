terraform {
  backend "s3" {
    bucket       = "marzena-terraform-state"
    key          = "vaultpay-infrastructure/terraform-learning/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}