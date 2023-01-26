<p align="center">
  <img src="https://github.com/eldios/nomad-on-docker/blob/main/assets/logo.jpg?raw=true" alt="Nomad on Docker logo"/>
</p>

# 🤖 Nomad on Docker .. plus some good stuff 🤖

<h3 align="center">Hashicorp Nomad on Docker</h3>

### Menu

- [Intro](#-intro)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Usage](#-usage)
- [Clean up](#-clean-up)
- [Build image locally](#-build-image-locally)

## 🧾 Intro

Do you want to run Hashicorp Nomad on Docker via Compose? Look no further! 

This repo provides a comprehensive set of instructions to get you up and running quickly.

Plus, you can now add some humor to your deployments with our amazing cyberpunk-style Nomad mascot! (*)

*So, don't wait any longer. Get started with Nomad on Docker now and enjoy the exciting ride.*

***Happy Nomading!***

(*): thanks to DeepAI for the nice image! <3

## 🔌 Requirements

The whole workflow revolves around a few tools, which are also the basic
requirements for running this lab.

### Minimum
* Docker running on a Linux system
* Docker Compose (either via `docker-compose` or `docker compose`)
* working Internet connectvity (to download the Docker images)

### Suggested
* Make
* Terraform (for the usage examples in the `tf` directory)

## 📥 Installation
Using this repo is as simple as following the 3 steps below:

1. Clone this repo via Git. Usually:
```
git clone https://github.com/eldios/nomad-on-docker.git
```
2. cd into the directory and run Make:
```
cd nomad-on-docker && make
```
3. ✅ Done! ✅ You should now have a Nomad cluster up and running in Docker!

## 🤠 Usage

Once you have your Nomad cluster running, you can use it to deploy applications, manage workloads, and more. Here are some examples of what you can do:

- Deploy a simple web server with Nomad
- Monitor the health of your Nomad cluster
- Run tests and PoCs
- Get to know how Nomad works

To give you some ideas, I added a quick example in the `tf` directory.

The example will install a Caddy web server and a Traefik Reverse Proxy that
will work as the cluster Ingress.

The Terraform file is pretty easy as it just invokes the Nomad provider and then
sources both the Nomad job files.

The two Nomad files are `app.hcl` for the Caddy server and `ingress.hcl` for the
Traefik server respectively.

These are just meant to be examples but are beyond the scope of this tutorial.

If you want to test out the example I provided, you can start the cluster from 
scratch by using the following command:
```
make full-up
```
This will take care of setting up the Nomad cluster in Docker and immediately
add the example application via Terraform inside the created Nomad cluster.

If the cluster is already up and running, you can just run:
```
make tf-up
```

## 🧹 Clean up
To remove the Nomad cluster, run the following command:

```
make clean
```

This will remove the Nomad cluster and all associated Docker containers.

## 🔨 Build image locally
If preferred it's also entirely possible to ***build the Docker image locally*** by using the `Dockerfile` provided in the `docker` directory.

This approach would also make it possible to customise the Docker container Nomad image, if needed.

To build the container locally, just run:
```
cd docker
docker build -t eldios/nomad .
```

If you decide to change the `tag` during the build process, remember to change the image name also in the `docker-compose.yml` file.
