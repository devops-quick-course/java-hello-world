# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"

provider "aws" {
  #access_key =  "${env.AWS_ACCESS_KEY}"
  #secreat_key =  "${env.AWS_SECRET_ACCESS_KEY}" 
  region     = "ap-south-1"
}

resource "aws_instance" "quick_course" {
 # ami           = "ami-02913db388613c3e1"
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
}
