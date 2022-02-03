# Terraform Environments

Ambientes provisionados via Terragrunt e Terraform.

## Requisitos

| **Terraform**  | **Terragrunt**    |
|----------------|-------------------|
| `version 14.0` | `version v0.23.4` |

## Ambientes

| **Ambiente**  | **Região**   | **CIDR da VPC**  | **Descrição**   |
|---------------|--------------|------------------|-----------------|
|     `dev`     |  `us-east-1` | `             `  | Dev (us-east-1) |
|     `stg`     |  `us-east-1` | `             `  | Stg (us-east-1) |
|     `prd`     |  `us-east-1` | `             `  | Prd (us-east-1) |

## Estrutura de diretórios

A seguinte estrutura de diretórios é utilizada neste repositório:

```
tf-environments/
└── aws/                         # Cloud provider (gcp, aws, etc)
    └── <ambiente>/                     # Nome do ambiente (staging, production, etc)
        ├── terragrunt.hcl              # Configuração do Terragrunt (bucket de state, comandos extras, etc)
        └── environment.tfvars          # Variáveis usadas em *todas* as blueprints do *ambiente*
```

Exemplo:

```
terraform-environments/
└── aws/
    └── prd/
        ├── terragrunt.hcl
        ├── environment.tfvars
        └── stackdata/
            └── terragrunt.hcl
```


## Deploy

Para realizar a implantação das aplicações é necessário seguir os seguinte passos:

 * Acessar a pasta do ambiente **[aws]/[AMBIENTE]**
 * Acessar uma pasta de aplicações **stackdata** ou **resource**
 * Acessar a pasta da aplicação que será feito deploy
 * Configurar as credenciais necessárias:
 *      AWS (AWS_PROFILE='default')
 * Após isso execute `terragrunt plan`
 * Verifique os recursos a serem criados, e então execute `terragrunt apply`

Pronto! Agora você ja tem a infraestrutura da sua aplicação implantada.

