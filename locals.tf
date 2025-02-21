locals {
  rendered_file_content = file("${path.root}/${var.file}")
  zip = "lambda_canary-${sha256(local.rendered_file_content)}.zip"
}
