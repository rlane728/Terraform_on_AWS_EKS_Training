# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type = string
  default = "t3.micro"
}

# AWS EC2 Instance Key Pair
/*
Location is ./private-key/MyAWSKey.pem
I've simply soft-linked in my pem file for security purposes.  terraform has no problem with this
Oddly though, the location of the file under terraform root doesn't seem to matter
I renamed the directory "poo-key" and terraform still found the key file
I searched for some documentation on this but didn't find what I was looking for
Makes me wonder... if I put a .tf in a subdirectory will it still be processed, and in what order?
Going to try it.
*/
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "MyAWSKey"
}

# AWS EC2 Instance Type - List
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = ["t3.micro", "t3.small", "t3.large"]  
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "qa" = "t3.small"
    "prod" = "t3.large"
  }
}
