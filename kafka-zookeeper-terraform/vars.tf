variable "ami" {
  default = "ami-005bdb005fb00e791"
}

variable "instance_type" {
  default = "t2.large"
}

variable "region" {
  default = "us-west-2"
}

variable "kafka_cluster_instance_count" {
  default = "3"
}

variable "spark_cluster_instance_count" {
  default = "0"
}

variable "spot_instance_price" {
  default = "0.03"
}
