workflow "Deploy on Now" {
  on = "push"
  resolves = ["alias"]
}

action "deploy" {
  uses = "actions/zeit-now@master"
  secrets = [
    "ceN3Xxa54hBqAJMChYedffV1",
  ]
}

action "alias" {
  needs = ["deploy"]
  uses = "actions/zeit-now@master"
  args = "alias"
  secrets = [
    "ceN3Xxa54hBqAJMChYedffV1",
  ]
}
