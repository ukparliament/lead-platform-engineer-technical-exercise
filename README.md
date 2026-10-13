# Lead Platform Engineer Interview Exercise

## Scenario

A product team has built Team Portal, a small ASP.NET Core application that counts
assets stored in Azure Blob Storage. Terraform provisions its Azure resource group,
Linux App Service, Storage Account and assets container. GitHub Actions builds and
tests the application and manages infrastructure changes.

The current implementation supports one team. Other teams may later need the same
capability, with a consistent way to build, deploy and operate their own applications.

## Interview

Work collaboratively with the interviewer for approximately one hour. Start by
understanding the application and the overall solution, then make a focused set of
improvements across the application code, infrastructure and CI/CD, prioritising
where you think changes provide the most value. You are not expected to fix
everything or produce a production-ready system.

Explain your priorities, risks, trade-offs and assumptions as you work. Discuss how
the solution could evolve from a one-team implementation into a reusable platform
capability for multiple teams. Use documentation and your usual development tools,
and ask questions to clarify requirements. No Azure deployment is required.

## Repository

- [src/TeamPortal](src/TeamPortal): ASP.NET Core application and Blob Storage service.
- [tests/TeamPortal.Tests](tests/TeamPortal.Tests): application tests.
- [terraform/providers.tf](terraform/providers.tf): Terraform, provider and backend configuration.
- [terraform/main.tf](terraform/main.tf): Azure resources and application settings.
- [terraform/variables.tf](terraform/variables.tf): Deployment inputs.
- [terraform/outputs.tf](terraform/outputs.tf): Resource endpoints.
- [.github/workflows/infrastructure.yml](.github/workflows/infrastructure.yml): Application checks and infrastructure pipeline.

## Local Checks

Run the application checks from the repository root:

```sh
dotnet restore tests/TeamPortal.Tests/TeamPortal.Tests.csproj
dotnet build tests/TeamPortal.Tests/TeamPortal.Tests.csproj --no-restore
dotnet test tests/TeamPortal.Tests/TeamPortal.Tests.csproj --no-build --no-restore
```

With Terraform installed, check the configuration without an Azure subscription:

```sh
cd terraform
terraform fmt -check
terraform init -backend=false
terraform validate
```

Terraform initialisation requires access to the provider registry. The configured
remote backend is assumed to exist already; do not deploy changes to Azure.
