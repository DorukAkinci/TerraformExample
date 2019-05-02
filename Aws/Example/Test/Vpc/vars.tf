variable "backend_s3_bucket" {  description = "Backend S3 Bucket" default="example.test.terraform" } 
variable "backend_s3_key" {  description = "Backend S3 Key" default="NETSEC/vpc" }
variable "backend_s3_region" {  description = "Backend S3 Region" default="eu-west-1" }
variable "backend_s3_profile" {  description = "Backend S3 Profile" default="example" }

variable "provider_aws_region" {  description = "Provider AWS Region" default="eu-west-1" }
variable "provider_aws_profile" {  description = "Provider AWS Profile" default="example" }

variable "vpc_tag_name" {  description = "VPC Name" default="TEST_TR_IRELAND" } 
variable "vpc_tag_env" {  description = "VPC Environment" default="example" } 
variable "vpc_cidr_block" {  description = "VPC CIDR Block" default="10.51.0.0/16" } 
variable "vpc_region_id" {  description = "VPC Region" default="eu-west-1" } 

variable "subnet_az1_region_id" {  description = "AZ1 Region Id" default="eu-west-1a" } 

variable "subnet_az1_external_cidr_block" {  description = "Subnet AZ1 External CIDR Block" default="10.51.0.0/24" }
variable "subnet_az1_presentation_cidr_block" {  description = "Subnet AZ1 Presentation CIDR Block" default="10.51.10.0/24" }
variable "subnet_az1_service_cidr_block" {  description = "Subnet AZ1 Service CIDR Block" default="10.51.20.0/24" }
variable "subnet_az1_database_cidr_block" {  description = "Subnet AZ1 Database CIDR Block" default="10.51.30.0/24" }
variable "subnet_az1_dataservice_cidr_block" {  description = "Subnet AZ1 DataService CIDR Block" default="10.51.40.0/24" }
variable "subnet_az1_management_cidr_block" {  description = "Subnet AZ1 Management CIDR Block" default="10.51.50.0/24" }

variable "subnet_az2_region_id" {  description = "AZ2 Region Id" default="eu-west-1b" } 

variable "subnet_az2_external_cidr_block" {  description = "Subnet AZ2 External CIDR Block" default="10.51.100.0/24" }
variable "subnet_az2_presentation_cidr_block" {  description = "Subnet AZ2 Presentation CIDR Block" default="10.51.110.0/24" }
variable "subnet_az2_service_cidr_block" {  description = "Subnet AZ2 Service CIDR Block" default="10.51.120.0/24" }
variable "subnet_az2_database_cidr_block" {  description = "Subnet AZ2 Database CIDR Block" default="10.51.130.0/24" }
variable "subnet_az2_dataservice_cidr_block" {  description = "Subnet AZ2 DataService CIDR Block" default="10.51.140.0/24" }
variable "subnet_az2_management_cidr_block" {  description = "Subnet AZ2 Management CIDR Block" default="10.51.150.0/24" }

variable "route_polat_cidr_block" {  description = "Polat CIDR Block" default="172.28.0.0/16" }




#data "aws_availability_zones" "all" {}