workflow "Deploy on Now" {
    on = "push"
    resolves = ["release"]
}

# Deploy
action "deploy" {
    uses = "actions/zeit-now@master"
    args = "--no-clipboard --local-config=now.json"
    secrets = ["ZEIT_TOKEN"]
}

# Always create an alias using the SHA
action "alias" {
    needs = "deploy"
    uses = "actions/zeit-now@master"
    args = "alias `cat /github/home/deploy.txt` $GITHUB_SHA"
    secrets = ["ZEIT_TOKEN"]
}

# Add aliases
action "release" {
    needs = "deploy"
    uses = "actions/zeit-now@master"
    args = "alias --local-config=now.json"
    secrets = ["ZEIT_TOKEN"]
}
