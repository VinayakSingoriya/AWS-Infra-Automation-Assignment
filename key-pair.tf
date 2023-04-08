resource "aws_key_pair" "deployer" {
  key_name   = "cloudComputing"
  public_key = file("/home/vinayak/.ssh/strapi_rsa.pub")
}