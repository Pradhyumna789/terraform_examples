resource "aws_s3_bucket" "first_bucket" {
    bucket = "my-first-s3-bucket-200319-october"
}

resource "aws_s3_object" "create-s3-bucket-object" {
    bucket = aws_s3_bucket.first_bucket.id
    key = "finance.doc"
}

data "aws_iam_user" "john" {
    user_name = "john"
}

data "aws_s3_bucket" "first" {
    bucket = "my-first-s3-bucket-200319-october"
}

resource "aws_s3_bucket_policy" "create-finance-object-policy-attach-to-bucket" {
    bucket = aws_s3_bucket.first_bucket.id
    policy = jsonencode({
    Version = "2012-10-17",
    Id = "ExamplePolicy01",
    Statement = [
            {
                Sid = "ExampleStatement01",
                Effect = "Allow",
                Principal = {
                    AWS = data.aws_iam_user.john.arn
                },
                Action = [
                    "s3:GetObject"
                ],
                Resource = [
                    "${data.aws_s3_bucket.first.arn}/*"
                ]
            }
        ]
    })

}