provider "nomad" { }

resource "nomad_job" "app" {
  jobspec = file("${path.module}/app.hcl")
}

resource "nomad_job" "ingress" {
  jobspec = file("${path.module}/ingress.hcl")
}
