#not possible to attach the secrets that's gonna be used
#not possible to configure auto-scaling storage configuration

resource "aws_msk_cluster" "custom" {
  cluster_name           = var.msk-cluster-name
  kafka_version          = var.msk-kafka-version
  number_of_broker_nodes = var.msk-number-of-brokers

  configuration_info {
    arn = var.msk-configuration-arn
    revision = var.msk-configuration-latest_revision
  }

  broker_node_group_info {
    instance_type   = var.msk-instance-type
    ebs_volume_size = var.msk-ebs-volume-size
    client_subnets = var.msk-client-subnets
    security_groups = var.msk-security-groups
  }

 client_authentication {
   sasl {
      scram = var.msk-sasl-scram
      iam = var.msk-sasl-iam
   }
  }
  encryption_info {
      encryption_in_transit {
        client_broker = var.msk-encript-client-broker
        in_cluster = var.msk-encrypt-in-cluster
      }
    encryption_at_rest_kms_key_arn = var.msk-encript-at-rest-kms-key
  }

  enhanced_monitoring = var.msk-enhanced-monitoring

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = var.msk-enable-jmx-exporter
      }
      node_exporter {
        enabled_in_broker = var.msk-enable-node-exporter
      }
    }
  }

  tags = {
    Name        = format("%s-%s", var.msk-cluster-name, var.environment)
    Environment = var.environment
    Platform    = "MSK"
    Type        = "APACHE KAFKA"
  }

}