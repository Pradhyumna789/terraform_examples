resource "local_sensitive_file" "name" {
    filename = each.value
    for_each = var.users
    content = var.content
}
