provider "nomad" {
  # set Nomad API entrypoint here or via NOMAD_ADDR env variable
  # address = "http://__CHANGEME__:4646" # NOMAD_ADDR
}

resource "nomad_job" "app" {
  jobspec = file("${path.module}/app.hcl")
}

resource "nomad_job" "ingress" {
  jobspec = file("${path.module}/ingress.hcl")
}
