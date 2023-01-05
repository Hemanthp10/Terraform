provider "aws" {
	region = "us-east-1"
	access_key = ""
	secret_key = ""
}

resource "aws_instance" "instance1" {
      ami = "ami-0574da719dca65348"
      instance_type == "t2.micro"
      key_name == "jan2023"
}
