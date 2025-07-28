resource "aws_dynamodb_table" "demo-table" {
    name = "test-table"
    hash_key = "TestTableHashKey"
    billing_mode = "PROVISIONED"
    read_capacity = 1
    write_capacity = 1

    attribute {
      name = "TestTableHashKey"
      type = "S"
    }
}



resource "aws_dynamodb_table_item" "car-one" {
    table_name = aws_dynamodb_table.demo-table.name
    hash_key = aws_dynamodb_table.demo-table.hash_key
    item = file("${path.module}/car-one.json")
}
