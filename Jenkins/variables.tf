variable "AWS_AMI" {
  description = "Give AWS AMI Value"
}

variable "InstanceType" {
  description = "Instance type here"
  default     = "t2.micro"
}

variable "KeyPairInformation" {
  description = "Give Key Name Here"
  default     = "MumbaiKey"
}

variable "tagsinfo" {
  type        = list(string)
  description = "Tags or name here"
  # default     = ["jenkins_Server", "Node_1", "Node_1"]
}
