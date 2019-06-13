
output "ip" {
  value = "${aws_spot_instance_request.my-instance.*.public_ip}"
}