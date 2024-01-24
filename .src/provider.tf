terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  # token = "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"
  token = "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"
  owner = "myrtech-io"
}
