# Copyright 2024 Canonical Ltd.
# See LICENSE file for licensing details.

resource "juju_model" "oai-ran-cu" {
  count = var.create_model == true ? 1 : 0
  name  = var.model_name
}

module "cu" {
  source     = "git::https://github.com/canonical/oai-ran-cu-k8s-operator//terraform"
  model_name = var.create_model == true ? juju_model.oai-ran-cu[0].name : var.model_name
  channel    = var.cu_channel
  config     = var.cu_config
}

module "grafana-agent" {
  source     = "git::https://github.com/canonical/terraform-juju-sdcore//modules/external/grafana-agent-k8s"
  model_name = var.create_model == true ? juju_model.oai-ran-cu[0].name : var.model_name
  channel    = var.grafana_agent_channel
  config     = var.grafana_agent_config
}

# Integrations for `logging` endpoint

resource "juju_integration" "cu-logging" {
  model = var.create_model == true ? juju_model.oai-ran-cu[0].name : var.model_name

  application {
    name     = module.cu.app_name
    endpoint = module.cu.logging_endpoint
  }

  application {
    name     = module.grafana-agent.app_name
    endpoint = module.grafana-agent.logging_provider_endpoint
  }
}

# Cross-model integrations

resource "juju_offer" "cu-fiveg-f1" {
  model            = var.model_name
  application_name = module.cu.app_name
  endpoint         = module.cu.fiveg_f1_endpoint
}
