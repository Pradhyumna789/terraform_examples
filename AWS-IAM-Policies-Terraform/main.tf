resource "aws_iam_user" "application_developer" {
    name = "john"
    tags = {
        Description = "app-dev"
    }
}

resource "aws_iam_policy" "policy" {
    name = "test-policy"
    policy = file("admin-policy.json")
}

resource "aws_iam_policy_attachment" "test-policy-attachment" {
    name = "test-attachment"
    users = [aws_iam_user.application_developer.name]
    policy_arn = aws_iam_policy.policy.arn
}
