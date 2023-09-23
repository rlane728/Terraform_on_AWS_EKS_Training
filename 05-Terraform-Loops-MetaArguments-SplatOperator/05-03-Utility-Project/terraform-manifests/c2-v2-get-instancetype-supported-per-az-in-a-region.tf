# Check if that respective Instance Type is supported in that Specific Region in list of availability Zones
# Get the List of Availability Zones in a Particular region where that respective Instance Type is supported
# Datasource
data "aws_ec2_instance_type_offerings" "my_ins_type2" {
  for_each = toset([ "us-east-1a", "us-east-1b", "us-east-1e" ])  # <---FOR_EACH only accepts maps and sets, hence the "toset"
  filter {
    name   = "instance-type"
    values = ["t3.micro", "t2.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]  # <---The key from FOR_EACH above
  }
  location_type = "availability-zone"
}


#Output-1
# Important Note: Once for_each is set, its attributes must be accessed on specific instances
output "output_v2_1" {
  #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types                       # <---Since we're pulling FOR_EACH, a direct value will not work.
  value = toset([for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.instance_types])   # <---Instead we must have FOR type output.
  #..............FOR N IN {the named locations from "my_ins_type2" DATASET}: RETURN N.instance_types 
}

#Output-2
# Create a Map with Key as Availability Zone and value as Instance Type supported
output "output_v2_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type2: az => details.instance_types
   #FOR KEY, VALUE in my_ins_type2 DATASET..............................: map KEY => VALUE.instance_types
   #.................................................................example: us-east-1a = [t3.micro]
  }
}

