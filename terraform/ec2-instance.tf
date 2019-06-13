# follow the tutorial here: https://www.bogotobogo.com/DevOps/Terraform/Terraform-terraform-format-tf-and-interpolation-variables.php
resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-demo"
  public_key = "${file("terraform-demo.pub")}"
}

resource "aws_spot_instance_request" "my-instance" {
  spot_price           = "${var.spot_instance_price}"
  ami                  = "${var.ami}"
  instance_type        = "${var.instance_type}"
  key_name             = "${aws_key_pair.terraform-demo.key_name}"
  user_data            = "${file("install-jre-ubuntu.sh")}"
  wait_for_fulfillment = true
  count                = "${var.instance_count}"

  tags = {
    Name  = "Terraform-${count.index + 1}"
    Batch = "5AM"
  }
}
