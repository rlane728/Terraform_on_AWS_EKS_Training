# Terraform Output Values


# data.aws_availability_zones
output "availability_zones" {
  description = "AWS Availability Zones in Dataset Defined in c5-ec2instance.tf"
  value = data.aws_availability_zones.my_azones
  #value = data.aws_availability_zones.my_azones.names
  #value = data.aws_availability_zones.my_azones.names[2]
}
