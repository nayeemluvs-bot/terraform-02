variable "pet_prefix" {
  description = "Prefix used when generating the pet name"
  type        = string
  default     = "HR"
}

variable "pet_length" {
  description = "Number of characters in the generated pet name"
  type        = number
  default     = 1
}

variable "output_file" {
  description = "Path of the file Terrafor will create"
  type        = string
  default     = "./pets.txt"
}