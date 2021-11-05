resource "aws_dynamodb_table" "equity_price" {
  name = "EquityPrice"
  billing_mode = "PROVISIONED"
  read_capacity = 20
  write_capacity  = 20
  hash_key  = "symbol"
  range_key = "time"
  
  attribute {
    name  = "symbol"
    type  = "S"
  }
  
  attribute {
    name  = "time"
    type  = "S"
  }
  
  tags = {
    Name = "equity-price-table"
    Environment = "dev"
  }
    
}
