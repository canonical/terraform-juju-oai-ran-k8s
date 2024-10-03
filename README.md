# Charmed OAI RAN for Kubernetes Terraform Modules

This project contains 3 [Terraform][Terraform] modules deploying the 5G RAN (Radio Access Network) in the following configurations:
- [OAI RAN K8s][OAI RAN K8s] - complete deployment of the [Charmed OAI RAN][Charmed OAI RAN] using the 5G Functional (F1) Split
- [OAI RAN CU K8s][OAI RAN CU K8s] - deployment of the [Charmed OAI RAN][Charmed OAI RAN] CU (Central Unit) subsystem
- [OAI RAN DU K8s][OAI RAN DU K8s] - deployment of the [Charmed OAI RAN][Charmed OAI RAN] DU (Distributed Unit) subsystem

The modules use the [Terraform Juju provider][Terraform Juju provider] to model the bundle deployment onto any Kubernetes environment managed by [Juju][Juju].

To learn more about deploying private Charmed 5G network visit our documentation:
- [Charmed Aether SD-Core][Charmed Aether SD-Core]
- [Charmed OAI RAN][Charmed OAI RAN]

[Terraform]: https://www.terraform.io/
[Terraform Juju provider]: https://registry.terraform.io/providers/juju/juju/latest
[Juju]: https://juju.is
[OAI RAN K8s]: https://github.com/canonical/terraform-juju-oai-ran-k8s/modules/oai-ran-k8s
[OAI RAN CU K8s]: https://github.com/canonical/terraform-juju-oai-ran-k8s/modules/oai-ran-cu-k8s
[OAI RAN DU K8s]: https://github.com/canonical/terraform-juju-oai-ran-k8s/modules/oai-ran-du-k8s
[Charmed Aether SD-Core]: https://canonical-charmed-aether-sd-core.readthedocs-hosted.com/en/latest/tutorials
[Charmed OAI RAN]: https://canonical-charmed-oai-ran.readthedocs-hosted.com/en/latest/tutorials
