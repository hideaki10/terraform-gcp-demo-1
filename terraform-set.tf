terraform {
  required_version = ">=0.12.14"
  backend "gcs" {
    bucket = "terraform-tfstate-docker-execies-20210522" #先程terraform applyで作成したGCSバケット名を記載します。
  }
}

## project ##
provider "google" {
  project = "docker-execies-20210522"
  region  = "asia-northeast1"
}

variable "location" {
  type    = string
  default = "asia-northeast1"
}

## GCS for terraform.tfstate  ##
resource "google_storage_bucket" "tfstate-bucket" {
  name          = "terraform-tfstate-docker-execies-20210522" #GCSのバケット名は全世界でユニークである必要があるので、ここでは適当にPROJECT_IDをSuffixとして付与します。
  location      = "asia-northeast1"
  storage_class = "REGIONAL"

  labels = {
    terraform = "true"
    app       = "terraform"
    env       = "test"
  }
}
