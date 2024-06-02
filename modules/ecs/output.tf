output "cluster_arn" {
  value = aws_ecs_cluster.main.arn
}

output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "cluster_tags_all" {
  value = aws_ecs_cluster.main.tags_all
}

output "cluster_configuration" {
  value = aws_ecs_cluster.main.configuration
}

output "log_group_arn" {
    value = aws_cloudwatch_log_group.main.arn
}

output "log_group_name" {
    value = aws_cloudwatch_log_group.main.name
}