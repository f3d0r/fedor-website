workflow "Deploy on Now" {
  on = "push"
  resolves = ["release"]
}

# Deploy
action "deploy" {
  uses = "actions/zeit-now@master"
  args = "--public --no-clipboard --local-config=now.json"
  secrets = ["ZEIT_TOKEN"]
}

# Add aliases
action "release" {
  needs = "master-branch-filter"
  uses = "actions/zeit-now@master"
  args = "alias --local-config=now.json"
  secrets = ["ZEIT_TOKEN"]
}
