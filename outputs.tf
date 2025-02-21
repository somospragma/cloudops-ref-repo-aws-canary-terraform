output "canary_id" {
  description = "El ID del canario creado."
  value       = aws_synthetics_canary.canary.id
}

output "canary_arn" {
  description = "El ARN del canario creado."
  value       = aws_synthetics_canary.canary.arn
}

output "canary_state" {
  description = "El estado actual del canario."
  value       = aws_synthetics_canary.canary.status
}
