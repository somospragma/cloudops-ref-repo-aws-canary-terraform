data "archive_file" "lambda_canary_zip" {
  type        = "zip"
  output_path = local.zip
  source {
    content  = local.rendered_file_content
    filename = "nodejs/node_modules/index.js"
  }
}