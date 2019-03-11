workflow "Deploy to Now" {
    on = "push"
    resolves = [
        "Deploy"
    ]
}

action "deploy-main" {
    uses = "actions/zeit-now@master"
    secrets = ["ZEIT_TOKEN"]
    args = "--local-config=now.json"
}

action "deploy-redirects" {
    needs = "deploy-main"
    uses = "actions/zeit-now@master"
    secrets = ["ZEIT_TOKEN"]
    args = "--local-config=.redirects/now.json"
}