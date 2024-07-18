output "PubServer" {
  value = aws_instance.JenkinsProject[0].public_ip

}