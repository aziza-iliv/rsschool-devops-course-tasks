resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["7560D6F40FA55195F740EE2B1B7C0B4836CBE103"]
}

resource "aws_iam_role" "github_actions" {
  name = "GithubActionsRole"


  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::381491972551:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:aziza-iliv/rsschool-devops-course-tasks:*"
                },
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                }
            }
        }]
   })
}
