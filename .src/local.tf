locals {
  repositories = yamldecode(file("../repositories.yaml")).repositories
  teams = yamldecode(file("teams.yaml"))

  team = flatten ([
    for teams,details in local.teams : [
      for k,v in details : {
        team_name = teams.name
      }
    ]
  ])
}