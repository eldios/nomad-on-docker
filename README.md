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

Do you want to run [Hashicorp Nomad](https://github.com/hashicorp/nomad) on [Docker](https://www.docker.com/) via [Compose](https://docs.docker.com/compose/)? Look no further! 

This repo provides a comprehensive set of instructions to get you up and running quickly.

Plus, you can now add some humor to your deployments with our amazing cyberpunk-style Nomad mascot! (*)

*So, don't wait any longer. Get started with Nomad on Docker now and enjoy the exciting ride.*

***Happy Nomading!***

(*): thanks to [DeepAI](https://deepai.org/) for the nice image! <3

## 🔌 Requirements

The whole workflow revolves around a few tools, which are also the basic
requirements for running this lab.

### Minimum
* [Docker](https://www.docker.com/) running on a Linux system
* [Docker Compose](https://docs.docker.com/compose/) (either via `docker-compose` or `docker compose`)
* working Internet connectvity (to download the Docker images)
* about 400 MB free on disk for the repo + Docker images

### Suggested
* [Git](https://git-scm.com/) .. to clone this repo .. unless you want to download it as a zip ;)
* [Make](https://www.gnu.org/software/make/)
* [Terraform](https://github.com/hashicorp/terraform) (for the usage examples in the `tf` directory)

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

<p align="center">
  <img src="https://github.com/eldios/nomad-on-docker/blob/main/assets/empty_sad_cluster.png?raw=true" alt="Picture of an empty Nomad on Docker with a sadge icon"/>
</p>

Wait a second .. your cluster is working but empty and super lonely! 💔

If you want to make use of it and make super happy, proceed to the next paragraph!

## 🤠 Usage

Once you have your Nomad cluster running, you can use it to deploy applications, manage workloads, and more. Here are some examples of what you can do:

- Deploy a simple web server with Nomad
- Monitor the health of your Nomad cluster
- Run tests and PoCs
- Get to know how Nomad works

To give you some ideas, I added a quick example in the `tf` directory.

The example will install a [Caddy](https://github.com/caddyserver/caddy) web server and a [Traefik](https://github.com/traefik/traefik) Reverse Proxy that
will work as the cluster Ingress.

The Terraform file is pretty easy as it just invokes the [Terraform Nomad provider](https://registry.terraform.io/providers/hashicorp/nomad/latest/docs) 
and then sources both the Nomad job files.

The two Nomad files are `app.hcl` for the Caddy server and `ingress.hcl` for the
Traefik server respectively.

These are just meant to be examples but are beyond the scope of this tutorial.

### ♻️ IF YOUR NOMAD CLUSTER IS UP ALREADY
This will take care of setting up the Nomad cluster in Docker and immediately
add the example application via Terraform inside the created Nomad cluster.

If the cluster is already up and running, you can just run:
```
make tf-up
```
### 🎉 IF YOU PREFER AN ALL-IN-ONE SETUP COMMAND
If you prefer you can start the cluster from scratch AND add the web app 
via Terraform ALL IN ONE COMMAND by using the following code:
```
make full-up
```

<p align="center">
  <img src="https://github.com/eldios/nomad-on-docker/blob/main/assets/functional_happy_cluster.png?raw=true" alt="Picture of an functional Nomad on Docker with an happy icon"/>
</p>

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
