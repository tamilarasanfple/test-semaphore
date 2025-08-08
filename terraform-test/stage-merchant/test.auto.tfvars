aws_region     = "ap-southeast-1"
ami_id         = "ami-094c67f3080a703ed"
instance_type  = "t3a.small"
vpc_id         = "vpc-008ef35c8f0a03e1e"
subnet_id      = "subnet-001b9ed96fcca68da"
name           = "stage_test "
volume_size    = 60
iam_role_name  = "CloudWatchAgentRole"
key_name       = "nex191"
hostname       = "stage-test"
common_tags = {
  Name        = "stage_test"
  Application = "ec2"
  Env         = "stage"
  Project     = "test"
}
project = "test"
