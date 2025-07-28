resource "aws_dynamodb_table" "demo-table-2" {
    name = "test-table-2"
    hash_key = "TestTableHashKeyTwo"
    billing_mode = "PROVISIONED"
    read_capacity = 20
    write_capacity = 20

    attribute {
      name = "TestTableHashKeyTwo"
      type = "S"
    }
}

resource "aws_dynamodb_table_item" "car-two" {
    table_name = aws_dynamodb_table.demo-table-2.name
    hash_key = aws_dynamodb_table.demo-table-2.hash_key
    item = <<ITEM
        {
            "TestTableHashKeyTwo": {"S": "Something"},
            "Manufacturer": {"S": "Rolls Royce"},
            "Number": {"N": "1"},
            "Model": {"S": "Phantom"}
        }
        ITEM
}

