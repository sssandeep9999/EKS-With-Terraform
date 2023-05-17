terraform {
  backend "s3" {
    bucket = "satya901"
    key    = "terraform/state"
  }
}
