resource "aws_s3_bucket" "equitypricelog" {
  acl = "private"
  bucket = "rbequitypricelog"
}
