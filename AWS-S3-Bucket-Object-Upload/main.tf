resource "aws_s3_bucket" "woody-s3-bucket" {
    bucket = "woody-allen-30-november-1935"
}

resource "aws_s3_object" "upload" {
    key = "woody"
    source = "${path.module}/woody.jpg"
    bucket = "woody-allen-30-november-1935"
}
