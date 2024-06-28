# create cars table
resource "aws_dynamodb_table" "cars" {
  name         = "cars"
  billing_mode = "PAY_PER_REQUEST"
  # defines the primary key
  hash_key = "VIN"
  # the only mandatory attribute to define is the primary key
  attribute {
    name = "VIN"
    type = "S"
  }
}

# insert one document to cars table
resource "aws_dynamodb_table_item" "car-items" {
  table_name = aws_dynamodb_table.cars.name
  hash_key   = aws_dynamodb_table.cars.hash_key
  item       = <<EOF
    {
      "VIN": {"S": "AAA123"},
      "Manufacturer": {"S": "toyota"},
      "Make": {"S": "corolla"},
      "year": {"N": "2014" }
    }
  EOF
}
