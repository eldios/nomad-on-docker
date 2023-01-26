job "ingress" {
  datacenters = ["dc1"]

  type        = "service"

  group "proxy" {
    count = 1

    network {
      mode = "host"
      port  "ingressHttp"{
         static = 80
         to = 80
      }
      port  "ingressHttps"{
         static = 443
         to = 443
      }
      port  "ingressAdmin"{
         static = 8080
         to = 8080
      }
    }

    service {
      name = "http"
      provider = "nomad"
      port = "ingressHttp"
    }
    service {
      name = "https"
      provider = "nomad"
      port = "ingressHttps"
    }
    service {
      name = "admin"
      provider = "nomad"
      port = "ingressAdmin"
    }

    task "server" {
      driver = "docker"
      config {
        image = "traefik:v2.9"
        ports = [
          "ingressAdmin", 
          "ingressHttp"
        ]
        args = [
          "--providers.nomad=true",
          "--providers.nomad.exposedByDefault=false",
          "--providers.nomad.endpoint.address=http://${NOMAD_HOST_IP_ingressAdmin}:4646",
          "--experimental.http3=true",

          "--api.dashboard=true",
          "--api.insecure=true", ### For Test only, please do not use that in production
          "--entrypoints.traefik.address=:${NOMAD_PORT_ingressAdmin}",

          "--entrypoints.http.http3",
          "--entryPoints.http.http2.maxConcurrentStreams=250",
          "--entrypoints.http.address=:${NOMAD_PORT_ingressHttp}",

          "--entrypoints.https.http3",
          "--entryPoints.https.http2.maxConcurrentStreams=250",
          "--entrypoints.https.address=:${NOMAD_PORT_ingressHttps}",
        ]
      }
      resources {
        cpu    = 1000
        memory = 2048
      }
    }
  }
}
