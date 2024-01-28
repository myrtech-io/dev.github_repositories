locals {
  # repositories = yamldecode(file("../repositories.yaml")).repositories
  parsed_teams = yamldecode(file("teams.yaml"))["teams"]
  team_info = flatten([
    for team in local.parsed_teams : [
      for member, values in team.members : {
        name            = team.name
        description     = team.description
        member_username = values.username
        member_role     = values.role
      }
    ]
  ])

  flattened_repositories = flatten([
    for repo in jsondecode(data.external.repositories.result) : [
      for pattern, value in toset(repo.branch_prefixes) : {
        repo          = repo.name
        branch_prefix = value
      }
    ]
  ])
}

data "external" "repositories" {
  program = ["sh", "-c", "yq eval -o=json - < ../repositories.yaml | jq ."]
}