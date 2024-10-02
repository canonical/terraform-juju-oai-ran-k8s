# Copyright 2024 Canonical Ltd.
# See LICENSE file for licensing details.

# Integration offers for external systems

output "cu_fiveg_f1_offer_url" {
  description = ""
  value       = juju_offer.cu-fiveg-f1.url
}

# Outputs required to consume external offers

output "cu_app_name" {
  description = "Name of the deployed CU application."
  value       = module.cu.app_name
}
output "fiveg_n2_endpoint" {
  description = "Name of the endpoint to integrate with `fiveg_n2` interface."
  value       = module.cu.fiveg_n2_endpoint
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
