job "app" {
  datacenters = ["dc1"]

  group "web" {
    count = 1

    network {
      port "appHttp" {
        to = 80
      }
      port "appHttps" {
        to = 443
      }
      port "appAdmin" {
        to = 2019
      }
    }

    service {
      provider = "nomad"
      port     = "appHttp"
      name     = "app-web-http"

      tags = [
        "traefik.enable=true",
        "traefik.http.routers.app-web-http.entrypoints=http",
        "traefik.http.routers.app-web-http.Rule=Path(`/`)",
      ]
    }

    service {
      provider = "nomad"
      port     = "appHttps"
    }

    task "server" {
      driver = "docker"
      config {
        image          = "caddy:2-alpine"
        ports          = [
          "appHttp",
          "appHttps",
          "appAdmin",
        ]
      }

      resources {
        cpu    = 500
        memory = 1024
      }
    }

  }

}
