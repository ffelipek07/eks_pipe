## Requisitos

| **Terraform**  | **Terragrunt**    |
|----------------|-------------------|
| `version >= 14.0` | `version v0.23.4` |

# Terraform Blueprints

Repositório de blueprints dos ambientes.

Blueprints (também conhecidas como _infrastructure modules_) são os componentes
propriamente ditos da infraestrutura, que pré-configuram resources e módulos-base
(mantidos nos repositórios `tf-modules/<provider>/*`).

## Usabilidade
O uso dos blueprint, serve como provisionamento da infraestrutura em contexto de aplicação, provisionando todos os recursos necessários dentro de um contexto.

## Contextos de aplicação
* StackData
  * EKS
  * Nifi & Nginx Ingress Helm Charts
  * RDS Postgres
  * S3 Bucket 


## Contextos de aplicação
* Resource
  * EKS
  * Nifi & Nginx Ingress Helm Charts
  * S3 Bucket 