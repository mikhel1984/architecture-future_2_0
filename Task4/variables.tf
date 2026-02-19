
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

variable "hardware" {
  description = "Disc type"
  type        = string
  default     = "network-ssd"
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex folder ID"
  type        = string
}

variable "token" {
  description = "Yandex token"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
  default     = "asdin1231_qine"
}
