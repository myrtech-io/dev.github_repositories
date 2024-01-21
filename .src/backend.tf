terraform {
  cloud {
    organization = "myrtech-io"

    workspaces {
      name = "myrtech-io-github"
    }
  }
}