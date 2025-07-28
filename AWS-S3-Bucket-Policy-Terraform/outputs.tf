output "arn-of-john" {
    value = data.aws_iam_user.john.arn
}

output "s3-bucket-arn" {
    value = data.aws_s3_bucket.first.arn
}
