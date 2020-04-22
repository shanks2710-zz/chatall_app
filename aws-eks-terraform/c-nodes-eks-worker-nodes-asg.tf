# usage of the specific kubernetes.io/cluster/* resource tag is required for 
# EKS and Kubernetes to discover and manage compute resources

# Note:
# vpc_zone_identifier  = ["${aws_subnet.demo.*.id}"]
# was replaced with:
# vpc_zone_identifier  = "${aws_subnet.demo.*.id}"

resource "aws_autoscaling_group" "demo" {
  desired_capacity     = 2
  launch_configuration = "${aws_launch_configuration.demo.id}"
  max_size             = 2
  min_size             = 1
  name                 = "terraform-eks-finalproject"
  vpc_zone_identifier  = "${aws_subnet.demo.*.id}"

  tag {
    key                 = "Name"
    value               = "terraform-eks-finalproject"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }
}
