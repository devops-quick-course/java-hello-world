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
  
  security_groups = ["${aws_security_group.docker.name}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  connection {
    user = "ubuntu"
    key_file = "ssh/key"
  }
  provisioner "file" {
    source = "key.pem"
    destination = "/home/ubuntu/key.pem"
  } 
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
    #  "sudo apt-get install apt-transport-https ca-certificates",
    #  "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D",
    #  "sudo sh -c 'echo \"deb https://apt.dockerproject.org/repo ubuntu-trusty main\" > /etc/apt/sources.list.d/docker.list'",
      "sudo apt-get remove docker docker-engine docker.io",
      "sudo apt install docker.io",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
     # "sudo apt-get install -y docker-engine=1.12.0-0~trusty",
      "sudo apt-get install awscli",
      "sudo chmod 400 /home/ubuntu/test.pem",
    ]
  }
}
