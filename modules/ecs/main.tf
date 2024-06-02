resource "aws_cloudwatch_log_group" "main" {
  name = var.ecs_config.log_config_name
}

resource "aws_ecs_cluster" "main" {
  name = var.ecs_config.cluster_name

  configuration {
    execute_command_configuration {
      logging = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.main.name
      }
    }
  }
}

resource "aws_ecs_task_definition" "main" {
  for_each = var.task_definition_config

  family = each.value.family

  container_definitions = jsonencode([
    {
      name      = each.value.container_definition.name
      image     = each.value.container_definition.image
      cpu     = each.value.container_definition.cpu
      memory    = each.value.container_definition.memory
      essential = each.value.container_definition.essential
      portMappings = [
        {
          containerPort = each.value.container_definition.port
          hostPost      = each.value.container_definition.port
        }

      ]
    }
  ])
}
