#!/bin/bash

# Run a command in specific directory
run() {
    target_dir="$1"
    previous_dir=$(pwd)
    shift
    cd $target_dir && "$@"
    cd $previous_dir
}

aws s3 rm s3://stackdata-emr-logs-dev/ --recursive
# aws s3 rm s3://stackdata-emr-logs-qas/ --recursive

# export TF_LOG=trace
# export TF_LOG_PATH=/tmp/terragrunt-logs
export TERRAGRUNT_AUTO_RETRY=true
# senha de exemplo nao usar nos ambientes
export TF_VAR_mks_username="alice"
export TF_VAR_mks_password="alice-secret"
export TF_VAR_rds_username_aheadpro="aheadpro"
export TF_VAR_rds_passwd_aheadpro="rdspass123"
export TF_VAR_rds_username_decoder="decoder"
export TF_VAR_rds_passwd_decoder="rdspass123"
export TF_VAR_mq_application_user="mqsys"
export TF_VAR_mq_application_password="mqpasswd"

find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;

mkdir log
# em caso de lixo, limpar o state
# run aws/qas/eks/ terragrunt state rm kubernetes_namespace.custom >> tmp/terragrunt-eks-state.log
# run aws/qas/eks/ terragrunt state rm module.default_aws_eks.kubernetes_config_map.aws_auth >> tmp/terragrunt-eks-state.log
# run aws/qas/eks/ terragrunt state rm helm_release.custom >> tmp/terragrunt-eks-state.log
# run aws/qas/eks/ terragrunt state list >> tmp/terragrunt-eks-state-list.log

# # # atualizando kube config
aws eks update-kubeconfig --name stackdata-dev-eks --role-arn arn:aws:iam::121144830179:role/dev-eks-admin --verbose
# # # remoção do metrics server ante de remover eks
kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
sleep 30
kubectl delete namespace development
sleep 20

#stackdata
run aws/dev/eks/ terragrunt destroy --auto-approve >> log/terragrunt-destroy-eks.log
run aws/dev/emr/ terragrunt destroy --auto-approve >> log/terragrunt-destroy-emr.log
run aws/dev/mq/ terragrunt destroy --auto-approve >> log/terragrunt-destroy-mq.log
run aws/dev/msk/ terragrunt destroy --auto-approve >> log/terragrunt-destroy-msk.log
run aws/dev/rds/ terragrunt destroy --auto-approve >> log/terragrunt-destroy-rds.log
run aws/dev/s3/ terragrunt destroy --auto-approve >> log/terragrunt-destroy-s3.log
run aws/dev/ts/ terragrunt destroy --auto-approve >> log/terragrunt-destroy-ts.log
# #resource
run aws/dev/resource/ terragrunt destroy --auto-approve >> log/terragrunt-destroy-resource.log
