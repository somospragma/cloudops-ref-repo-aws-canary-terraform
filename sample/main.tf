module "canary" {
  source                = "./module/canary"

  # Variables de nombramiento
  client        = var.client
  project       = var.project
  environment   = var.environment
  application   = var.application
  functionality = var.functionality


  # Variables de construcción
  artifact_s3_location  = "s3://<bucket_name>"
  file                  = "index.js.tpl"
  runtime_version       = "syn-nodejs-puppeteer-9.1"
  handler               = "index.handler"
  schedule_expression   = "rate(5 minutes)"
  schedule_duration_in_seconds = 0
}
