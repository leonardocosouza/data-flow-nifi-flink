terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = ">= 0.2.1"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.23.1"
    }
  }
}
