resource "aws_iam_user" "mary" {
  name = "mary"
}

resource "aws_iam_user" "john" {
  name = "john"
}

resource "aws_iam_user" "jack" {
  name = "jack"
}

resource "aws_iam_user_policy_attachment" "admin-policy-attachment" {
  user = aws_iam_user.mary.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group" "developers-group" {
  name = "developers"
}

resource "aws_iam_user_group_membership" "jack-membership" {
  user = aws_iam_user.jack.name
  groups = [ 
    aws_iam_group.developers-group.name
   ]
}

resource "aws_iam_user_group_membership" "john-membership" {
  user = aws_iam_user.john.name
  groups = [ 
    aws_iam_group.developers-group.name
   ]
}

resource "aws_iam_group_policy_attachment" "ec2-full-access-attachment" {
  group = aws_iam_group.developers-group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}