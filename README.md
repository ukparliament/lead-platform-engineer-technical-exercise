# Lead Platform Engineer Interview Exercise

## Scenario

A product team has created an initial Azure deployment for Team Portal, an ASP.NET
Core web application that stores and serves files through Azure Blob Storage. Its single
development environment is a starting point for production and, later, other
product teams.

The team's first Terraform configuration and GitHub Actions workflow provision
a resource group, Linux App Service Plan, App Service and Storage Account with an
assets container. Application code and deployment are outside this exercise's scope.

## Interview

Work with an interviewer for approximately one hour to review the implementation,
discuss priorities and make focused improvements. You are not expected to fix
everything or produce a production-ready deployment.

Prioritise the most important improvements and explain your reasoning, risks,
trade-offs and assumptions. Discuss what you would address next and how the
solution could evolve into a reusable platform capability for other teams.

Use documentation and your usual development tools, and ask questions to clarify
requirements. No Azure deployment is required.

## Repository

- [terraform/providers.tf](terraform/providers.tf): Terraform, provider and backend configuration.
- [terraform/main.tf](terraform/main.tf): Azure resources.
- [terraform/variables.tf](terraform/variables.tf): Deployment inputs.
- [terraform/outputs.tf](terraform/outputs.tf): Resource endpoints.
- [.github/workflows/infrastructure.yml](.github/workflows/infrastructure.yml): Infrastructure pipeline.

## Local Checks

With Terraform installed, you can check the configuration without an Azure
subscription:

```sh
cd terraform
terraform fmt -check
terraform init -backend=false
terraform validate
```

Initialisation requires access to the Terraform provider registry. The configured
backend is assumed to exist already.
