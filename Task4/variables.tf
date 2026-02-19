
variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "os" {
  description = "Operation system index"
  type        = string
  default     = "fd8374e62db66ee5f00c"  # Ubuntu 20.04
}
