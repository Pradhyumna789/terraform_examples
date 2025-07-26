resource "local_sensitive_file" "name" {
  count = length(var.users)
  filename = var.users[count.index] 
  content  = var.content
}
