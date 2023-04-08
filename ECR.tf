resource "aws_ecr_repository" "flask" {
  name = "flask-repo"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_ecr_repository_policy" "flaskECR_policy" {
  repository = aws_ecr_repository.flask.name

  policy = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Sid       = "AllowPublicAccess",
        Effect    = "Allow",
        Principal = "*",
        Action = [
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetAuthorizationToken",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories"
        ]
      }
    ]
  })
}
