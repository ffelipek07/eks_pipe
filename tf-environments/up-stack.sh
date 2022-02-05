#!/bin/bash

# Run a command in specific directory
run() {
    target_dir="$1"
    previous_dir=$(pwd)
    shift
    cd $target_dir && "$@"
    cd $previous_dir
}

# aws s3 rm s3://stackdata-emr-logs-dev/ --recursive
# aws s3 rm s3://stackdata-emr-logs-qas/ --recursive

# export TF_LOG=trace
export TF_LOG_PATH=/tmp/terragrunt-logs
export TERRAGRUNT_AUTO_RETRY=true


find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;

mkdir log

#vpc
# run aws/dev/vpc terragrunt plan
# run aws/dev/ecr terragrunt plan
# run aws/dev/s3 terragrunt plan

# run aws/dev/eks terragrunt plan


 run aws/dev/vpc terragrunt destroy --auto-approve >> log/terragrunt-apply-vpc.log
 #run aws/dev/ecr terragrunt destroy --auto-approve >> log/terragrunt-apply-ecr.log
 run aws/dev/s3 terragrunt destroy --auto-approve >> log/terragrunt-apply-s3.log
 #run aws/dev/eks terragrunt destroy --auto-approve >> log/terragrunt-apply-eks.log

# run aws/dev/vpc terragrunt apply --auto-approve >> log/terragrunt-apply-vpc.log
# run aws/dev/ecr terragrunt apply --auto-approve >> log/terragrunt-apply-ecr.log
# run aws/dev/s3 terragrunt apply --auto-approve >> log/terragrunt-apply-s3.log
# run aws/dev/eks terragrunt apply --auto-approve >> log/terragrunt-apply-eks.log


#run aws/dev/vpc terragrunt apply --auto-approve >> log/terragrunt-apply-vpc.log

#stackdata
#run aws/dev/eks terragrunt apply --auto-approve >> log/terragrunt-apply-eks.log
# # atualizando kube config
#aws eks update-kubeconfig --name stackdata-dev-eks --role-arn arn:aws:iam::121144830179:role/dev-eks-admin --verbose
# # instalação do metrics server após o deployment do eks
#kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# run aws/dev/vpc terragrunt apply --auto-approve >> log/terragrunt-apply-vpc.log
# run aws/dev/ecr terragrunt apply --auto-approve >> log/terragrunt-apply-ecr.log
# run aws/dev/s3 terragrunt apply --auto-approve >> log/terragrunt-apply-s3.log
# run aws/dev/eks terragrunt apply --auto-approve >> log/terragrunt-apply-eks.log
