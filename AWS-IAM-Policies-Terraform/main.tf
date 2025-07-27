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

// Create a separate provider.tf file and paste these => you can also skip passing credentials and just enter the region and it'll work just fine
// Inside the provider block after entering the region argument and the value for it do the following
//  skip_credentials_validation = true
//  skip_requesting_account_id  = true
