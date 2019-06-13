variable "ami" {
  default = "ami-005bdb005fb00e791"
}

variable "instance_type" {
  default = "t2.nano"
}

variable "region" {
  default = "us-west-2"
}

variable "instance_count" {
  default = "2"
}

variable "spot_instance_price" {
  default = "0.03"
}

