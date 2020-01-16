# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"

provider "aws" {
 environment { 
                AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
            }
 # region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-02913db388613c3e1"
  instance_type = "t2.micro"
}
