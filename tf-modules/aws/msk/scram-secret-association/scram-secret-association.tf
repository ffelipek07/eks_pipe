resource "aws_msk_scram_secret_association" "custom" {
  cluster_arn     = var.msk-cluster-arn
  secret_arn_list = [var.secret-arn]

  depends_on = [var.msk-scram-depends-on]
}