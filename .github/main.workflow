workflow "Deploy to Now" {
    on = "push"
    resolves = [
        "Deploy"
    ]
}

action "Deploy" {
    uses = "actions/zeit-now@master"
    secrets = ["ZEIT_TOKEN"]
    args = "--local-config=now.json"
}