workflow "Deploy to Now" {
    on = "push"
    resolves = [
        "Deploy"
    ]
}

action "Deploy Main" {
    uses = "actions/zeit-now@master"
    secrets = ["ZEIT_TOKEN"]
    args = "--local-config=now.json"
}

action "Deploy Redirects" {
    needs = "Deploy Main"
    uses = "actions/zeit-now@master"
    secrets = ["ZEIT_TOKEN"]
    args = "--local-config=.redirects/now.json"
}