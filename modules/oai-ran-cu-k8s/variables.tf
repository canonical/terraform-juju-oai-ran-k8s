# Copyright 2024 Canonical Ltd.
# See LICENSE file for licensing details.

variable "model_name" {
  description = "Name of Juju model to deploy applications to."
  type        = string
  default     = "ran-cu"
}

variable "create_model" {
  description = "Allows to skip Juju model creation and re-use a model created in a higher level module."
  type        = bool
  default     = true
}

variable "cu_channel" {
  description = "The channel to use when deploying Charmed OAI RAN CU."
  type        = string
  default     = "2.1/edge"
}
variable "cu_config" {
  description = "Application config for the CU. Details about available options can be found at https://charmhub.io/oai-ran-cu-k8s/configurations."
  type        = map(string)
  default     = {}
}

# Grafana Agent K8s

variable "grafana_agent_channel" {
  description = "The channel to use when deploying `grafana-agent-k8s` charm."
  type        = string
  default     = "1/stable"
}
variable "grafana_agent_config" {
  description = "Additional configuration for the Grafana Agent. Details about available options can be found at https://charmhub.io/grafana-agent-k8s/configure."
  type        = map(string)
  default     = {}
}
