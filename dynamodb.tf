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
  
  ttl {
    attribute_name = "TimeToExist"
    enabled = true
  }
  
  tags = {
    Name = "equity-price-table"
    Environment = "dev"
  }
    
}


resource "aws_kinesis_stream" "equity_price" {
  name        = "equity_price_changes"
  shard_count = 1
}

resource "aws_dynamodb_kinesis_streaming_destination" "equity_price" {
  stream_arn = aws_kinesis_stream.equity_price.arn
  table_name = aws_dynamodb_table.equity_price.name
}
