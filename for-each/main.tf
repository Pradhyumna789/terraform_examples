resource "local_file" "pet" {
    for_each = var.pets
    filename = each.key
    content = each.value
}
