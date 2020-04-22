#
# EKS Cluster Resources
#  * EKS Cluster
#
#  It can take a few minutes to provision on AWS

# Note: replace subnet_ids = ["${aws_subnet.demo.*.id}"]
# with:
# subnet_ids = flatten([aws_subnet.demo.0.id, aws_subnet.demo.1.id])
# or:
# subnet_ids = "${aws_subnet.demo.*.id}"

resource "aws_eks_cluster" "demo" {
  name     = var.cluster-name
  role_arn = aws_iam_role.demo-cluster.arn

  vpc_config {
    security_group_ids = ["${aws_security_group.demo-cluster.id}"]
    subnet_ids         = "${aws_subnet.demo.*.id}"
  }

  depends_on = [
    aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy,
  ]
}
