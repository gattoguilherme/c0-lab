module "ecs" {
    source = "./modules/ecs"
    ecs_config = var.ecs_config
    task_definition_config = var.task_definition_config
}