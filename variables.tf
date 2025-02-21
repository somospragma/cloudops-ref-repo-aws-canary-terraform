#Variables de nombramiento

variable "client" {
  type = string
}

variable "environment" {
  type = string
}

variable "project" {
  type = string  
}

variable "functionality" {
  type = string  
}

variable "application" {
  type = string  
}

#Variables del Canary

variable "artifact_s3_location" {
  description = "La ubicación en S3 donde se almacenarán los artefactos del canario (ej: s3://mi-bucket/canary-artifacts/)."
  type        = string
}

variable "runtime_version" {
  description = "La versión del runtime que utilizará el canario (ej: syn-nodejs-2.1)."
  type        = string
}

variable "handler" {
  description = "El handler o función de entrada del canario (ej: index.handler)."
  type        = string
}

variable "schedule_expression" {
  description = "La expresión de programación para la ejecución del canario (ej: rate(5 minutes))."
  type        = string
}

variable "schedule_duration_in_seconds" {
  description = "La duración en segundos del intervalo de la programación. Generalmente se establece en 0."
  type        = number
  default     = 0
}

variable "role_name" {
  description = "Nombre opcional para el rol de ejecución del canario. Si no se especifica, se usará <name>-canary-role."
  type        = string
  default     = ""
}

variable "file" {
  description = "archivo a subir"
  type        = string
}