locals {
    bucket_name = "tyler-test-bucket-123333"
    baseline_tags = {
        app = "TyApps"
        cost_center = 2000
        app_id = 1234
        other = "hi"
        team = "Enable"
    }
}

module "my_bucket" {
    source = "git::https://github.com/TyArndt/tf-aws-s3?ref=1.0.0"
    bucket_name = local.bucket_name
    #baseline_tags = local.baseline_tags
    baseline_tags = module.tags.tags
    #force_destroy = false
}

module "tags" {
    source = "git::https://github.com/TyArndt/tf-aws-tags"
    baseline_tags = local.baseline_tags
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# output "tags" {
#   value = module.tags.tags
# }