terraform {
  backend "s3" {
    bucket       = "terraform-state-bucet"
    key          = "terraform/state"
    region       = "ap-south-1"
    use_lockfile = "true"
  }
}
