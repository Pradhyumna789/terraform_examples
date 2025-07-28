resource "aws_iam_policy_attachment" "policy-attach" {
    for_each = var.users
    name = "ec2-read-only-policy-attachment"
    users = each.value.key
    policy_arn = each.value.users.value
}

