job "app" {
  datacenters = ["dc1"]

  group "web" {
    network {
      mode = "host"
      port "http" {
        to = 5678
        static = 80
      }
    }

    service {
      name     = "web"
      provider = "nomad"
      port     = "http"
    }

    task "server" {
      driver = "docker"

      config {
        image          = "hashicorp/http-echo:latest"
        ports          = ["http"]
        args = [
          "-text", "Hello and welcome to ${NOMAD_IP_http} running on port ${NOMAD_PORT_http}",
        ]
      }

      resources {
        cpu    = 500
        memory = 1024
      }
    }
  }
}
