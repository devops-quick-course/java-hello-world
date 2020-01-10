# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"

provider "aws" {
 $ export AWS_ACCESS_KEY_ID="key"
 $ export AWS_SECRET_ACCESS_KEY="skey"
 $ export AWS_DEFAULT_REGION="ap-south-1"
 $ terraform plan
 # region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-02913db388613c3e1"
  instance_type = "t2.micro"
}
