resource "github_repository" "myrtech-io-repos" {
  for_each = { for repo in local.repositories : repo.name => repo }

  name        = each.value.name
  description = each.value.description
  visibility  = "public"
}