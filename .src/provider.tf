terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "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"
  owner = "myrtech-io"
}
