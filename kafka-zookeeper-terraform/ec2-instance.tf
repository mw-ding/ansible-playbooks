resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-demo"
  public_key = "${file("terraform-demo.pub")}"
}

resource "aws_spot_instance_request" "spark-cluster" {
  spot_price           = "${var.spot_instance_price}"
  ami                  = "${var.ami}"
  instance_type        = "${var.instance_type}"
  key_name             = "${aws_key_pair.terraform-demo.key_name}"
  user_data            = "${file("install-jre-ubuntu.sh")}"
  wait_for_fulfillment = true
  count                = "${var.spark_cluster_instance_count}"

  tags = {
    Name  = "spark-instance-${count.index + 1}"
  }
}

resource "aws_spot_instance_request" "kafka-cluster" {
  spot_price           = "${var.spot_instance_price}"
  ami                  = "${var.ami}"
  instance_type        = "${var.instance_type}"
  key_name             = "${aws_key_pair.terraform-demo.key_name}"
  user_data            = "${file("install-jre-ubuntu.sh")}"
  wait_for_fulfillment = true
  count                = "${var.kafka_cluster_instance_count}"

  tags = {
    Name  = "kafka-instance-${count.index + 1}"
  }
}