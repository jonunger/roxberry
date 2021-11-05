resource "aws_dynamodb_table" "builddynamo" {
  name = "Customer"
  billing_mode = "PROVISIONED"
  read_capacity = 20
  write_capacity  = 20
  hash_key  = "customer_id"
  range_key = "last_name"
  
  attribute {
    name  = "customer_id"
    type  = "S"
  }
  
  attribute {
    name  = "last_name"
    type  = "S"
  }
}
