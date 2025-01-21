terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" #N.Verginia
}

resource "aws_key_pair" "bastion" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "kaizen-aiperi" {
    bucket = "kaizen-aiperi-s3"
}

resource "aws_s3_bucket" "first-my" {
  # trunk-ignore(git-diff-check/error)
  bucket = "first-my"
}

resource "aws_s3_bucket" "second-my" {
  bucket = "second-my"
}

#creating groups twice

resource "aws_iam_group" "first" {
  name = "first"
}

resource "aws_iam_group" "second" {
  name = "second"
}

#creating users with for loop

resource "aws_iam_user" "user" {
  for_each = toset([ "jihyo", "sana", "momo", "dahyun" ])
  name = each.value
}

#creating IAM group "twice"

resource "aws_iam_group" "group" {
  name = "twice"
}

#adding users to the Twice group

resource "aws_iam_group_membership" "team" {
  name = "membership"
  group = aws_iam_group.group.name
  users = [
    for user in aws_iam_user.user : user.name
   ]
}