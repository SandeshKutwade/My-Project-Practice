resource "aws_instance" "JenkinsProject" {
  ami           = var.AWS_AMI
  instance_type = var.InstanceType
  key_name      = var.KeyPairInformation
  tags = {
    Name = var.tagsinfo[count.index]
  }
  count = 2
}

