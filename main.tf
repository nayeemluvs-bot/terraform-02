terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "random_pet" "petname" {
  prefix    = var.pet_prefix
  separator = "."
  length    = var.pet_length
}

resource "local_file" "mypet" {
  filename = var.output_file
  content  = "My pet's name is: ${random_pet.petname.id}\n"
}