
## Providers / Requirements

| Name | Version |
|------|---------|
| [aws](#provider\_aws) | n/a |
| [random](#provider\_random) | n/a |
| [terraform](#provider\_terraform) | n/a |

Instalação terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
Instalação terragrunt: https://terragrunt.gruntwork.io/docs/getting-started/install

## Modules

| Name | Source | Version |
|------|--------|---------|
| [default\_aws\_eks](#module\_default\_aws\_eks) | terraform-aws-modules/eks/aws | n/a |
| [emr\_cluster](#module\_emr\_cluster) | cloudposse/emr-cluster/aws | n/a |
| [kms-key-msk](#module\_kms-key-msk) |  | n/a |
| [mq\_broker](#module\_mq\_broker) | cloudposse/mq-broker/aws | n/a |
| [msk-auto-scaling-policy](#module\_msk-auto-scaling-policy) | | n/a |
| [msk-auto-scaling-target](#module\_msk-auto-scaling-target) | | n/a |
| [msk-cluster](#module\_msk-cluster) | | n/a |
| [msk-configuration](#module\_msk-configuration) | | n/a |
| [msk-scram-secret-association](#module\_msk-scram-secret-association) | | n/a |
| [msk-scram-secret-association-policy](#module\_msk-scram-secret-association-policy) | | n/a |
| [rds\_postgres](#module\_rds\_postgres) | terraform-aws-modules/rds/aws | n/a |
| [s3-bucket-kms](#module\_s3-bucket-kms) | terraform-aws-modules/s3-bucket/aws | 2.9.0 |
| [s3\_log\_storage](#module\_s3\_log\_storage) | terraform-aws-modules/s3-bucket/aws | 2.9.0 |
| [secrets-manager-secret-msk](#module\_secrets-manager-secret-msk) | | n/a |
| [secrets-manager-secret-version-msk](#module\_secrets-manager-secret-version-msk) | | n/a |
| [timestream\_database](#module\_timestream\_database) | | n/a |
| [timestream\_table](#module\_timestream\_table) | | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_group_policy_attachment.iam-policy-attach-admin-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.iam-policy-attach-dev-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.iam_policy_admin_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.iam_policy_dev_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.k8sadmin_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.k8sdev_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_kms_key.s3_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_security_group.msk_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rds_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_uuid.msk_sm_secret_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [aws\_account\_id](#input\_aws\_account\_id) | AWS Account id (DEV: (ACCOUNT) STG: ACCOUNT PRD: ACCOUNT) | `string` | n/a | yes |
| [client](#input\_client) | Client name | `string` | n/a | yes |
| [eks\_cluster\_version](#input\_eks\_cluster\_version) | Kubernetes Version | `string` | `"1.20"` | no |
| [eks\_create\_eks](#input\_eks\_create\_eks) | Conditional EKS creation | `number` | `1` | no |
| [eks\_iam\_admin\_group\_name](#input\_eks\_iam\_admin\_group\_name) | IAM Admin group name for EKS permissions | `list(string)` | <pre>[<br>  "Administrator"<br>]</pre> | no |
| [eks\_iam\_dev\_group\_name](#input\_eks\_iam\_dev\_group\_name) | IAM Dev group name for EKS permissions | `list(string)` | <pre>[<br>  "Dev"<br>]</pre> | no |
| [eks\_node\_groups](#input\_eks\_node\_groups) | Map of map of node groups to create. | `any` | n/a | yes |
| [emr\_applications](#input\_emr\_applications) | A list of applications for the cluster. Valid values are: Flink, Ganglia, Hadoop, HBase, HCatalog, Hive, Hue, JupyterHub, Livy, Mahout, MXNet, Oozie, Phoenix, Pig, Presto, Spark, Sqoop, TensorFlow, Tez, Zeppelin, and ZooKeeper (as of EMR 5.25.0). Case insensitive | `list(string)` | n/a | yes |
| [emr\_configurations\_json](#input\_emr\_configurations\_json) | A JSON string for supplying list of configurations for the EMR cluster | `string` | `""` | no |
| [emr\_core\_instance\_group\_ebs\_size](#input\_emr\_core\_instance\_group\_ebs\_size) | Core instances volume size, in gibibytes (GiB) | `number` | n/a | yes |
| [emr\_core\_instance\_group\_ebs\_type](#input\_emr\_core\_instance\_group\_ebs\_type) | Core instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | n/a | yes |
| [emr\_core\_instance\_group\_ebs\_volumes\_per\_instance](#input\_emr\_core\_instance\_group\_ebs\_volumes\_per\_instance) | The number of EBS volumes with this configuration to attach to each EC2 instance in the Core instance group | `number` | n/a | yes |
| [emr\_core\_instance\_group\_instance\_count](#input\_emr\_core\_instance\_group\_instance\_count) | Target number of instances for the Core instance group. Must be at least 1 | `number` | n/a | yes |
| [emr\_core\_instance\_group\_instance\_type](#input\_emr\_core\_instance\_group\_instance\_type) | EC2 instance type for all instances in the Core instance group | `string` | n/a | yes |
| [emr\_create\_task\_instance\_group](#input\_emr\_create\_task\_instance\_group) | Whether to create an instance group for Task nodes. For more info: https://www.terraform.io/docs/providers/aws/r/emr_instance_group.html, https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-master-core-task-nodes.html | `bool` | n/a | yes |
| [emr\_ebs\_root\_volume\_size](#input\_emr\_ebs\_root\_volume\_size) | Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later | `number` | n/a | yes |
| [emr\_master\_instance\_group\_ebs\_size](#input\_emr\_master\_instance\_group\_ebs\_size) | Master instances volume size, in gibibytes (GiB) | `number` | n/a | yes |
| [emr\_master\_instance\_group\_ebs\_type](#input\_emr\_master\_instance\_group\_ebs\_type) | Master instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | n/a | yes |
| [emr\_master\_instance\_group\_ebs\_volumes\_per\_instance](#input\_emr\_master\_instance\_group\_ebs\_volumes\_per\_instance) | The number of EBS volumes with this configuration to attach to each EC2 instance in the Master instance group | `number` | n/a | yes |
| [emr\_master\_instance\_group\_instance\_count](#input\_emr\_master\_instance\_group\_instance\_count) | Target number of instances for the Master instance group. Must be at least 1 | `number` | n/a | yes |
| [emr\_master\_instance\_group\_instance\_type](#input\_emr\_master\_instance\_group\_instance\_type) | EC2 instance type for all instances in the Master instance group | `string` | n/a | yes |
| [emr\_name](#input\_emr\_name) | Name | `string` | n/a | yes |
| [emr\_namespace](#input\_emr\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | n/a | yes |
| [emr\_release\_label](#input\_emr\_release\_label) | The release label for the Amazon EMR release. https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html | `string` | n/a | yes |
| [emr\_visible\_to\_all\_users](#input\_emr\_visible\_to\_all\_users) | Whether the job flow is visible to all IAM users of the AWS account associated with the job flow | `bool` | n/a | yes |
| [env](#input\_env) | Environment Tag QA or PRD | `any` | n/a | yes |
| [kms\_ssm\_key\_arn](#input\_kms\_ssm\_key\_arn) | ARN of the AWS KMS key used for SSM encryption | `string` | `"alias/aws/ssm"` | no |
| [mq\_application\_password](#input\_mq\_application\_password) | User password | `string` | `null` | no |
| [mq\_application\_user](#input\_mq\_application\_user) | User username | `string` | `null` | no |
| [mq\_deployment\_mode](#input\_mq\_deployment\_mode) | The deployment mode of the broker. Supported: SINGLE\_INSTANCE and ACTIVE\_STANDBY\_MULTI\_AZ | `string` | n/a | yes |
| [mq\_engine\_type](#input\_mq\_engine\_type) | Type of broker engine, `ActiveMQ` or `RabbitMQ` | `string` | `"ActiveMQ"` | no |
| [mq\_engine\_version](#input\_mq\_engine\_version) | The version of the broker engine. See https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html for more details | `string` | `"5.15.15"` | no |
| [mq\_host\_instance\_type](#input\_mq\_host\_instance\_type) | The broker's instance type. e.g. mq.t2.micro or mq.m4.large | `string` | `"mq.t3.micro"` | no |
| [mq\_namespace](#input\_mq\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | n/a | yes |
| [msk-cluster-name](#input\_msk-cluster-name) | MSK cluster name | `string` | n/a | yes |
| [msk-cluster-num-brokers](#input\_msk-cluster-num-brokers) | MSK cluster num of brokers | `number` | n/a | yes |
| [msk-cluster-version](#input\_msk-cluster-version) | MSK cluster version | `string` | n/a | yes |
| [msk-configuration-name](#input\_msk-configuration-name) | AWS MSK configuration name | `string` | n/a | yes |
| [msk-configuration-version](#input\_msk-configuration-version) | Kafka versions compatible with this configuration | `set(string)` | n/a | yes |
| [msk-ebs-volume-size](#input\_msk-ebs-volume-size) | MSK broker EBS volume size | `number` | n/a | yes |
| [msk-enable-jmx-exporter](#input\_msk-enable-jmx-exporter) | MSK cluster Prometheus exporter for JMX | `bool` | `true` | no |
| [msk-enable-node-exporter](#input\_msk-enable-node-exporter) | MSK broker Prometheus exporter | `bool` | `true` | no |
| [msk-encript-at-rest-kms-key](#input\_msk-encript-at-rest-kms-key) | MSK broker encryption at rest KMS key | `string` | `""` | no |
| [msk-encript-client-broker](#input\_msk-encript-client-broker) | MSK client <-> broker encryption in transit | `string` | `"TLS"` | no |
| [msk-encrypt-in-cluster](#input\_msk-encrypt-in-cluster) | MSK broker encryption at rest | `bool` | `true` | no |
| [msk-enhanced-monitoring](#input\_msk-enhanced-monitoring) | MSK enhanced monitoring profile | `string` | `"DEFAULT"` | no |
| [msk-instance-type](#input\_msk-instance-type) | MSK broker instance type | `string` | n/a | yes |
| [msk-sasl-scram](#input\_msk-sasl-scram) | MSK cluster SASL-SCRAM (user/pass auth) support | `bool` | `true` | no |
| [msk-sm-secret-kms-key-name](#input\_msk-sm-secret-kms-key-name) | KMS key name to encrypt cluster auth user/password in Secrets Manager | `string` | n/a | yes |
| [msk-sm-secret-name](#input\_msk-sm-secret-name) | Secrets Manager secret's name to hold MSK auth user/password | `string` | n/a | yes |
| [msk\_sg\_name](#input\_msk\_sg\_name) | MSK VPC security group name | `string` | n/a | yes |
| [rds\_create\_monitoring\_role](#input\_rds\_create\_monitoring\_role) | Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | `bool` | `true` | no |
| [rds\_enable\_multi\_az](#input\_rds\_enable\_multi\_az) | Enable or not rds multi-az | `bool` | n/a | yes |
| [rds\_engine\_version](#input\_rds\_engine\_version) | The engine version to use | `string` | `"12.7"` | no |
| [rds\_family](#input\_rds\_family) | The family of the DB parameter group | `string` | `"postgres12"` | no |
| [rds\_identifier](#input\_rds\_identifier) | Name for the RDS | `string` | n/a | yes |
| [rds\_instance\_type](#input\_rds\_instance\_type) | RDS instance Type for postgres | `string` | n/a | yes |
| [rds\_major\_engine\_version](#input\_rds\_major\_engine\_version) | Specifies the major version of the engine that this option group should be associated with | `string` | `"12"` | no |
| [rds\_passwd](#input\_rds\_passwd) | Password for-admin user in rds instance | `string` | n/a | yes |
| [rds\_performance\_insights\_enabled](#input\_rds\_performance\_insights\_enabled) | Specifies whether Performance Insights are enabled | `bool` | n/a | yes |
| [rds\_sg\_name](#input\_rds\_sg\_name) | Name for the RDS Security Group | `string` | n/a | yes |
| [rds\_username](#input\_rds\_username) | Database admin username | `string` | n/a | yes |
| [region](#input\_region) | Provider Region | `string` | n/a | yes |
| [scaling\_policy\_name-msk](#input\_scaling\_policy\_name-msk) | MSK cluster autoscaling policy name | `string` | n/a | yes |
| [scaling\_policy\_predefined\_metric\_type-msk](#input\_scaling\_policy\_predefined\_metric\_type-msk) | MSK cluster autoscaling policy metric type | `string` | `"KafkaBrokerStorageUtilization"` | no |
| [scaling\_policy\_target\_value-msk](#input\_scaling\_policy\_target\_value-msk) | MSK cluster autoscaling scale policy threshold | `number` | n/a | yes |
| [scaling\_policy\_type-msk](#input\_scaling\_policy\_type-msk) | MSK cluster autoscaling policy type | `string` | `"TargetTrackingScaling"` | no |
| [scaling\_target\_max\_capacity-msk](#input\_scaling\_target\_max\_capacity-msk) | MSK cluster max EBS capacity | `number` | n/a | yes |
| [scaling\_target\_min\_capacity-msk](#input\_scaling\_target\_min\_capacity-msk) | MSK cluster min EBS capacity | `number` | n/a | yes |
| [scaling\_target\_scalable\_dimension-msk](#input\_scaling\_target\_scalable\_dimension-msk) | n/a | `string` | `"kafka:broker-storage:VolumeSize"` | no |
| [scaling\_target\_service\_namespace-msk](#input\_scaling\_target\_service\_namespace-msk) | n/a | `string` | `"kafka"` | no |
| [sm-secret-description-msk](#input\_sm-secret-description-msk) | Secrets Manager secret's description | `string` | `""` | no |
| [smv-secret-string-msk](#input\_smv-secret-string-msk) | Secrets Manager secret's value | `map(string)` | n/a | yes |
| [timestream\_databases](#input\_timestream\_databases) | Databases to be provisioned on AWS Timestream | `set(map(string))` | `[]` | no |
| [timestream\_tables](#input\_timestream\_tables) | Tables to be provisioned on AWS Timestream databases | `set(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| [broker\_id](#output\_broker\_id) | AmazonMQ broker ID |
| [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint for EKS control plane. |
| [cluster\_id](#output\_cluster\_id) | EMR cluster ID |
| [cluster\_master\_host](#output\_cluster\_master\_host) | Name of the cluster CNAME record for the master nodes in the parent DNS zone |
| [cluster\_master\_public\_dns](#output\_cluster\_master\_public\_dns) | Master public DNS |
| [cluster\_master\_security\_group\_id](#output\_cluster\_master\_security\_group\_id) | Master security group ID |
| [cluster\_name](#output\_cluster\_name) | EMR cluster name |
| [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Security group ids attached to the cluster control plane. |
| [cluster\_slave\_security\_group\_id](#output\_cluster\_slave\_security\_group\_id) | Slave security group ID |
| [config\_map\_aws\_auth](#output\_config\_map\_aws\_auth) | A kubernetes configuration to authenticate to this EKS cluster. |
| [kubectl\_config](#output\_kubectl\_config) | kubectl config as generated by the module. |
| [msk-bootstrap\_brokers\_sasl\_scram](#output\_msk-bootstrap\_brokers\_sasl\_scram) | MSK SASL-SCRAM broker list |
| [msk-bootstrap\_brokers\_tls](#output\_msk-bootstrap\_brokers\_tls) | MSK cluster TLS broker list |
| [msk-cluster-arn](#output\_msk-cluster-arn) | MSK cluster ARN |
| [msk-zookeeper\_connect\_string](#output\_msk-zookeeper\_connect\_string) | MSK cluster Zookeeper ensemble |
| [primary\_console\_url](#output\_primary\_console\_url) | AmazonMQ active web console URL |
| [primary\_ip\_address](#output\_primary\_ip\_address) | AmazonMQ primary IP address |
| [rds\_endpoint](#output\_rds\_endpoint) | The connection endpoint |
| [rds\_instance\_id](#output\_rds\_instance\_id) | The RDS instance ID |
| [rds\_security\_group](#output\_rds\_security\_group) | The RDS security group ID |
| [s3\_log\_storage\_bucket\_arn](#output\_s3\_log\_storage\_bucket\_arn) | Bucket ARN |
| [s3\_log\_storage\_bucket\_domain\_name](#output\_s3\_log\_storage\_bucket\_domain\_name) | FQDN of bucket |
| [s3\_log\_storage\_bucket\_id](#output\_s3\_log\_storage\_bucket\_id) | Bucket Name (aka ID) |
| [ts-database-arn](#output\_ts-database-arn) | Timestream database ARN |
| [ts-database-id](#output\_ts-database-id) | Timestream database id |
| [ts-table-arn](#output\_ts-table-arn) | Timestream table ARN |
| [ts-table-id](#output\_ts-table-id) | Timestream table id |
