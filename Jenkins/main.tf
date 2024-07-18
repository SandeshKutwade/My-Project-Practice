resource "aws_instance" "JenkinsProject" {
  ami           = var.AWS_AMI
  instance_type = var.InstanceType
  key_name      = var.KeyPairInformation
  tags = {
    Name = var.tagsinfo[count.index]
  }
  count = 1

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Users/sandeshkutwade/My Project Practice/MumbaiKey.pem")
    host        = aws_instance.JenkinsProject[0].public_ip
  }
  provisioner "file" {
    source      = "/Users/sandeshkutwade/My Project Practice/Jenkins/AllCICD.sh"
    destination = "/home/ubuntu/AllCICD.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 AllCICD.sh",
      "./AllCICD.sh"
    ]

  }



}

