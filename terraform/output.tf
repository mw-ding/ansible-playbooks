output "spark-instance-ips" {
  value = "${aws_spot_instance_request.spark-cluster.*.public_ip}"
}

output "kafka-instance-ips" {
  value = "${aws_spot_instance_request.kafka-cluster.*.public_ip}"
}
