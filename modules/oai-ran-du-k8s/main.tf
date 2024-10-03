# Copyright 2024 Canonical Ltd.
# See LICENSE file for licensing details.

resource "juju_model" "oai-ran-du" {
  count = var.create_model == true ? 1 : 0
  name  = var.model_name
}

module "du" {
  source     = "git::https://github.com/canonical/oai-ran-du-k8s-operator//terraform"
  model_name = var.create_model == true ? juju_model.oai-ran-du[0].name : var.model_name
  channel    = var.du_channel
  config     = var.du_config
}

module "grafana-agent" {
  source     = "git::https://github.com/canonical/terraform-juju-sdcore//modules/external/grafana-agent-k8s"
  model_name = var.create_model == true ? juju_model.oai-ran-du[0].name : var.model_name
  channel    = var.grafana_agent_channel
  config     = var.grafana_agent_config
}

# Integrations for `logging` endpoint

resource "juju_integration" "du-logging" {
  model = var.create_model == true ? juju_model.oai-ran-du[0].name : var.model_name

  application {
    name     = module.du.app_name
    endpoint = module.du.logging_endpoint
  }

  application {
    name     = module.grafana-agent.app_name
    endpoint = module.grafana-agent.logging_provider_endpoint
  }
}
