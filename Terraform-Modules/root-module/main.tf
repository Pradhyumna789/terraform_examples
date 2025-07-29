resource "local_file" "file" {
    filename = "${path.module}/cat.txt"
    content = var.content
}
