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

output "grafana_agent_app_name" {
  description = "Name of the deployed Grafana Agent application."
  value       = module.grafana-agent.app_name
}
output "send_remote_write_endpoint" {
  description = "Name of the endpoint to forward client charms metrics and associated alert rules to Prometheus using prometheus_remote_write interface."
  value       = module.grafana-agent.send_remote_write_endpoint
}
output "logging_consumer_endpoint" {
  description = "Name of the endpoint to send the logs to Loki using loki_push_api interface."
  value       = module.grafana-agent.logging_consumer_endpoint
}
