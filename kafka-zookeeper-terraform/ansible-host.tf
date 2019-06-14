data "template_file" "ansible-hosts" {
  template = "${file("ansible-host.tpl")}"
  vars = {
    spark-inst-ips = "${join("\n",aws_spot_instance_request.spark-cluster.*.public_ip)}"
    kafka-inst-ips = "${join("\n",aws_spot_instance_request.kafka-cluster.*.public_ip)}"
    key_path = "terraform-demo.pem"
  }
}

resource "null_resource" "ansible-hosts" {
  triggers {
    template_rendered = "${data.template_file.ansible-hosts.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.ansible-hosts.rendered}' > hosts"
  }
}