# Copyright 2024 Canonical Ltd.
# See LICENSE file for licensing details.

# Outputs required to consume external offers

output "du_app_name" {
  description = "Name of the deployed DU application."
  value       = module.du.app_name
}
output "fiveg_f1_endpoint" {
  description = "Name of the endpoint to integrate with `fiveg_f1` interface."
  value       = module.du.fiveg_f1_endpoint
}
