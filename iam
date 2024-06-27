provider "aws" {
  region  = "ap-south-1"
  profile = "tf-user"

}

# create iam users
resource "aws_iam_user" "demo" {
  name = "oggy"
}

resource "aws_iam_user" "demo1" {
  name = "olivia"
}

resource "aws_iam_user" "demo2" {
  name = "jack"
}

resource "aws_iam_user" "demo3" {
  name = "bob"
}
#create iam group
resource "aws_iam_group" "grp" {
  name = "oggyandcrocs"
}

resource "aws_iam_group" "team" {
  name = "tomandjerry"
}

# add users into group
resource "aws_iam_group_membership" "test" {

  name = "test_iam_group_membership"

  users = [ 
    aws_iam_user.demo.name,
    aws_iam_user.demo1.name,
    aws_iam_user.demo2.name,
    aws_iam_user.demo3.name
  ]
  group = aws_iam_group.grp.name
}
