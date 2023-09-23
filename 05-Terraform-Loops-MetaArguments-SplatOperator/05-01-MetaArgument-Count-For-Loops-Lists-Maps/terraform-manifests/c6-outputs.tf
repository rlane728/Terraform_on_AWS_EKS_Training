# Terraform Output Values
/* Concepts Covered
1. For Loop with List
2. For Loop with Map
3. For Loop with Map Advanced
4. Legacy Splat Operator (latest) - Returns List
5. Latest Generalized Splat Operator - Returns the List
*/

# Output - For Loop with List
  # FOR <VAR> in <RESOURCE_TYPE.RESOURCE_NAME>:
  # Remember, these were defined in c5-ec2instance
  # An instance will always have an instance.public_dns 
output "for_output_list" {
  description = "For Loop with List"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}
# For learning purposes, the output here is as follows"
/*
for_output_list = [
  "ec2-18-212-239-142.compute-1.amazonaws.com",
  "ec2-18-215-166-85.compute-1.amazonaws.com",
]
*/

# Output - For Loop with Map
  # FOR <VAR> in <RESOURCE_TYPE.RESOURCE_NAME>: KEY
  # Remember, these were defined in c5-ec2instance
  # An instance will always have an instance.id
output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}
# For learning purposes, the output here is as follows"
/*
for_output_map1 = {
  "i-024081833587ec034" = "ec2-18-212-239-142.compute-1.amazonaws.com"
  "i-051c815ab03d1afee" = "ec2-18-215-166-85.compute-1.amazonaws.com"
}
*/


# Output - For Loop with Map Advanced
  # "c" here is the count number
output "for_output_map2" {
  description = "For Loop with Map - Advanced"
  value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}
# For learning purposes, the output here is as follows"
/*
for_output_map2 = {
  "0" = "ec2-18-212-239-142.compute-1.amazonaws.com"
  "1" = "ec2-18-215-166-85.compute-1.amazonaws.com"
}
*/


# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized latest Splat Operator"
  value = aws_instance.myec2vm[*].public_dns
}
# For learning purposes, the output here is as follows"
/*
latest_splat_instance_publicdns = [
  "ec2-18-212-239-142.compute-1.amazonaws.com",
  "ec2-18-215-166-85.compute-1.amazonaws.com",
]
*/


# Output Legacy Splat Operator (Legacy) - Returns the List
/*
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.myec2vm.*.public_dns
}
*/