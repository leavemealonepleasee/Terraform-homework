# Specify the required Terraform version
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}



# Provider configuration for AWS
provider "aws" {
  region = "us-east-1"
}



# Create groups
resource "aws_iam_group" "blackpink" {
  name = "blackpink"  # Ensure name is specified
}

resource "aws_iam_group" "twice" {
  name = "twice"  # Ensure name is specified
}




# Create users for blackpink group
resource "aws_iam_user" "jenny" {
  name = "jenny"  # Ensure name is specified
}

resource "aws_iam_user" "rose" {
  name = "rose"  # Ensure name is specified
}

resource "aws_iam_user" "lisa" {
  name = "lisa"  # Ensure name is specified
}

resource "aws_iam_user" "jisoo" {
  name = "jisoo"  # Ensure name is specified
}

# Create users for twice group
resource "aws_iam_user" "jihyo" {
  name = "jihyo"  # Ensure name is specified
}

resource "aws_iam_user" "sana" {
  name = "sana"  # Ensure name is specified
}

resource "aws_iam_user" "momo" {
  name = "momo"  # Ensure name is specified
}

resource "aws_iam_user" "dahyun" {
  name = "dahyun"  # Ensure name is specified
}

# Add users to the blackpink group
resource "aws_iam_group_membership" "blackpink_members" {
  name = "blackpink"
  users = [
    aws_iam_user.jenny.name,
    aws_iam_user.rose.name,
    aws_iam_user.lisa.name,
    aws_iam_user.jisoo.name
  ]

  group = aws_iam_group.blackpink.name
}

# Add users to the twice group
resource "aws_iam_group_membership" "twice_members" {
  name = "twice"
  users = [
    aws_iam_user.jihyo.name,
    aws_iam_user.sana.name,
    aws_iam_user.momo.name,
    aws_iam_user.dahyun.name
  ]

  group = aws_iam_group.twice.name
}
