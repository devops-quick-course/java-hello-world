# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"

provider "aws" {
  access_key = "AKIAUJQN7LOPP7SNMFLU"
  secret_key = "zlImX98sw1TODQoou1gggTvFke6NBf57S9EhpTFZ"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-02913db388613c3e1"
  instance_type = "t2.micro"
}
