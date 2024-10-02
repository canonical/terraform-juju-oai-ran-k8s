# Copyright 2024 Canonical Ltd.
# See LICENSE file for licensing details.

resource "juju_model" "oai-ran" {
  count = var.create_model == true ? 1 : 0
  name  = var.model_name
}

module "cu" {
  source     = "git::https://github.com/canonical/oai-ran-cu-k8s-operator//terraform"
  model_name = var.create_model == true ? juju_model.oai-ran[0].name : var.model_name
  channel    = var.cu_channel
  config     = var.cu_config
}

module "du" {
  source     = "git::https://github.com/canonical/oai-ran-du-k8s-operator//terraform"
  model_name = var.create_model == true ? juju_model.oai-ran[0].name : var.model_name
  channel    = var.du_channel
  config     = var.du_config
}

module "grafana-agent" {
  source     = "git::https://github.com/canonical/terraform-juju-sdcore//modules/external/grafana-agent-k8s"
  model_name = var.create_model == true ? juju_model.oai-ran[0].name : var.model_name
  channel    = var.grafana_agent_channel
  config     = var.grafana_agent_config
}

# Integrations for `fiveg_f1` endpoint

resource "juju_integration" "du-f1" {
  model = var.create_model == true ? juju_model.oai-ran[0].name : var.model_name

  application {
    name     = module.du.app_name
    endpoint = module.du.fiveg_f1_endpoint
  }

  application {
    name     = module.cu.app_name
    endpoint = module.cu.fiveg_f1_endpoint
  }
}

# Integrations for `logging` endpoint

resource "juju_integration" "cu-logging" {
  model = var.create_model == true ? juju_model.oai-ran[0].name : var.model_name

  application {
    name     = module.cu.app_name
    endpoint = module.cu.logging_endpoint
  }

  application {
    name     = module.grafana-agent.app_name
    endpoint = module.grafana-agent.logging_provider_endpoint
  }
}

resource "juju_integration" "du-logging" {
  model = var.create_model == true ? juju_model.oai-ran[0].name : var.model_name

  application {
    name     = module.du.app_name
    endpoint = module.du.logging_endpoint
  }

  application {
    name     = module.grafana-agent.app_name
    endpoint = module.grafana-agent.logging_provider_endpoint
  }
}

# Cross-model integrations

resource "juju_offer" "cu-fiveg-gnb-identity" {
  model            = var.model_name
  application_name = module.cu.app_name
  endpoint         = module.cu.fiveg_gnb_identity_endpoint
}
