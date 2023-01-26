# 🤖 Nomad on Docker .. plus some good stuff 🤖

<p align="center">
  <img src="https://github.com/eldios/nomad-on-docker/blob/main/assets/logo.jpg?raw=true" alt="Nomad on Docker logo"/>
</p>

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

* Docker running on a Linux system
* Docker Compose (either via `docker-compose` or `docker compose`)
* Terraform
* Make
* working Internet connectvity (to download the Docker images)

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

TODO: Add EXAMPLES

## 🧹 Clean up
To remove the Nomad cluster, run the following command:

```
make clean
```

This will remove the Nomad cluster and all associated Docker containers.

## 🔨 Building locally
If preferred it's also entirely possible to build the Nomad Docker image locally by using the `Dockerfile` provider in the docker directory.

To do so, just run:
```
cd docker
docker build -t eldios/nomad .
```

If you decide to change the `tag` during the build process, remember to change the image name also in the `docker-compose.yml` file.
