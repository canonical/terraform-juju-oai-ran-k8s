# Charmed OAI RAN for Kubernetes Terraform Module

This folder contains a [Terraform][Terraform] module deploying the 5G RAN (Radio Access Network) subsystem using the Functional (F1) split.
The subsystem consists of the [Charmed OAI RAN CU K8s][Charmed OAI RAN CU K8s] NF (Network Function), [Charmed OAI RAN DU K8s][Charmed OAI RAN DU K8s] NF and the Grafana Agent to facilitate observability.

The module uses the [Terraform Juju provider][Terraform Juju provider] to model the charm deployment onto any Kubernetes environment managed by [Juju][Juju].

The module can be used to deploy the 5G RAN subsystem separately as well as a part of the higher level modules, depending on the deployment architecture.

## Deploying the Charmed OAI RAN for Kubernetes Terraform Module

To learn more about deploying private Charmed 5G network visit our documentation:
- [Charmed Aether SD-Core][Charmed Aether SD-Core]
- [Charmed OAI RAN][Charmed OAI RAN]

## Module structure

- **main.tf** - Defines the Juju application to be deployed.
- **variables.tf** - Allows customization of the deployment including Juju model name, charm's channel and configuration.
- **output.tf** - Responsible for integrating the module with other Terraform modules, primarily by defining potential integration endpoints (charm integrations).
- **versions.tf** - Defines the Terraform provider.

[Terraform]: https://www.terraform.io/
[Terraform Juju provider]: https://registry.terraform.io/providers/juju/juju/latest
[Juju]: https://juju.is
[Charmed OAI RAN CU K8s]: https://charmhub.io/oai-ran-cu-k8s
[Charmed OAI RAN DU K8s]: https://charmhub.io/oai-ran-du-k8s
[Charmed Aether SD-Core]: https://canonical-charmed-aether-sd-core.readthedocs-hosted.com/en/latest/tutorials
[Charmed OAI RAN]: https://canonical-charmed-oai-ran.readthedocs-hosted.com/en/latest/tutorials
