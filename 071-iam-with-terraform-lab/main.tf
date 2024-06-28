# create pepe user
resource "aws_iam_user" "pepe-user" {
  name          = "pepe"
  force_destroy = true
}

# create jack user
resource "aws_iam_user" "jack-user" {
  name          = "jack"
  force_destroy = true
}

# create jose user
resource "aws_iam_user" "jose-user" {
  name          = "jose"
  force_destroy = true
}

# provide pepe user with admin permissions
resource "aws_iam_user_policy_attachment" "admin-policy-attachment" {
  user       = aws_iam_user.pepe-user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# create developers securty group
resource "aws_iam_group" "developers-group" {
  name = "developers"
}

# add jack to developers security group
resource "aws_iam_user_group_membership" "jack-membership" {
  user = aws_iam_user.jack-user.name
  groups = [
    aws_iam_group.developers-group.name
  ]
}

# add jose to developers security group
resource "aws_iam_user_group_membership" "jose-membership" {
  user = aws_iam_user.jose-user.name
  groups = [
    aws_iam_group.developers-group.name
  ]
}

# provide developers security group with full permissions to EC2
resource "aws_iam_group_policy_attachment" "ec2-full-access-attachment" {
  group      = aws_iam_group.developers-group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
