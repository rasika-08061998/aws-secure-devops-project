module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "kms" {
  source = "../../modules/kms"
}

module "security" {
  source                 = "../../modules/security"
  vpc_id                 = module.vpc.vpc_id
  cloudtrail_bucket_name = "rasika-cloudtrail-logs-ap-south-1"
}

module "iam" {
  source = "../../modules/iam"
}

module "ecr" {
  source = "../../modules/ecr"
}

module "eks" {
  source             = "../../modules/eks"
  cluster_role_arn   = module.iam.eks_cluster_role_arn
  node_role_arn      = module.iam.eks_node_role_arn
  subnet_ids         = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  private_subnet_ids = module.vpc.private_subnet_ids
  kms_key_arn        = module.kms.kms_key_arn
}