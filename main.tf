terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"  #Specify the Docker provider source
      version = "~> 3.0.1"           # Specify the required version of the Docker provider
    }
  }
}

provider "docker" {}   # Configure the Docker provider

resource "docker_image" "nginx" {
  name         = "nginx"              # The name of the Docker image to use
  keep_locally = false                # Do not keep the image locally after
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id    # Use the image_id from the docker_image resource
  name  = "tutorial"                     # Name the Docker container "tutorial"

  ports {
    internal = 80                       # Map internal port 80 (inside the container)
    external = 8000                    # To external port 8000 (on the host machine)
  }
}
