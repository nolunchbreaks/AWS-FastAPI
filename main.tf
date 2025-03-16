# Use AWS provider
provider "aws" {
  region = "us-east-1"  # Change this if needed
}

# Create an ECS cluster
resource "aws_ecs_cluster" "flask_cluster" {
  name = "flask-cluster"
}

# Create an IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ecs-tasks.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

# Attach Amazon ECS Task Execution Role Policy
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Create an ECS Task Definition
resource "aws_ecs_task_definition" "flask_task" {
  family                   = "flask-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  container_definitions    = jsonencode([
    {
      name      = "flask-container"
      image     = "831926598912.dkr.ecr.us-east-1.amazonaws.com/flask-api:latest"
      essential = true
      portMappings = [{
        containerPort = 5000
        hostPort      = 5000
      }]
    }
  ])
}

# Create an ECS Service
resource "aws_ecs_service" "flask_service" {
  name            = "flask-service"
  cluster         = aws_ecs_cluster.flask_cluster.id
  task_definition = aws_ecs_task_definition.flask_task.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = ["subnet-056aede576ac2c3fc", "subnet-07b2ef15a526c9aad"] # Replace with your VPC Subnet IDs
    security_groups = ["sg-03a91fbdf0e89ab83"] # Replace with your Security Group ID
    assign_public_ip = true
  }

  desired_count = 1
}
