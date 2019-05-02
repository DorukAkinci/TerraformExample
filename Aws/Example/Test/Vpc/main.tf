terraform { #### CANNOT USE VARIABLES IN THIS SECTION!
  backend "s3" {
    bucket = "example.test.terraform"
    key    = "NETSEC/vpc"
    region = "eu-west-1"
    profile  = "example"
  }
}

provider "aws" {
    profile  = "${var.provider_aws_profile}"
    region = "${var.provider_aws_region}"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags {
    Name = "${var.vpc_tag_name}"
    Env = "${var.vpc_tag_env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "az1_external_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az1_region_id}"
  cidr_block = "${var.subnet_az1_external_cidr_block}"

  tags {
    Name = "AZ1_EXTERNAL_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az1_presentation_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az1_region_id}"
  cidr_block = "${var.subnet_az1_presentation_cidr_block}"

  tags {
    Name = "AZ1_PRESENTATION_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az1_service_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az1_region_id}"
  cidr_block = "${var.subnet_az1_service_cidr_block}"

  tags {
    Name = "AZ1_SERVICE_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az1_database_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az1_region_id}"
  cidr_block = "${var.subnet_az1_database_cidr_block}"

  tags {
    Name = "AZ1_DATABASE_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az1_dataservice_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az1_region_id}"
  cidr_block = "${var.subnet_az1_dataservice_cidr_block}"

  tags {
    Name = "AZ1_DATASERVICE_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az1_management_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az1_region_id}"
  cidr_block = "${var.subnet_az1_management_cidr_block}"

  tags {
    Name = "AZ1_MANAGEMENT_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az2_external_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az2_region_id}"
  cidr_block = "${var.subnet_az2_external_cidr_block}"

  tags {
    Name = "AZ2_EXTERNAL_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az2_presentation_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az2_region_id}"
  cidr_block = "${var.subnet_az2_presentation_cidr_block}"

  tags {
    Name = "AZ2_PRESENTATION_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az2_service_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az2_region_id}"
  cidr_block = "${var.subnet_az2_service_cidr_block}"

  tags {
    Name = "AZ2_SERVICE_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az2_database_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az2_region_id}"
  cidr_block = "${var.subnet_az2_database_cidr_block}"

  tags {
    Name = "AZ2_DATABASE_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az2_dataservice_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az2_region_id}"
  cidr_block = "${var.subnet_az2_dataservice_cidr_block}"

  tags {
    Name = "AZ2_DATASERVICE_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_subnet" "az2_management_01" {
  vpc_id     = "${aws_vpc.main.id}"
  availability_zone = "${var.subnet_az2_region_id}"
  cidr_block = "${var.subnet_az2_management_cidr_block}"

  tags {
    Name = "AZ2_MANAGEMENT_01"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "INTERNET_GW"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_vpn_gateway" "default" {
  vpc_id = "${aws_vpc.main.id}"
  
  tags {
    Name = "VPN_GW"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_route_table" "az1_private" {
  vpc_id  = "${aws_vpc.main.id}"
  
  tags {
    Name = "AZ1_RT_PRIVATE"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_route_table" "az2_private" {
  vpc_id  = "${aws_vpc.main.id}"
  
  tags {
    Name = "AZ2_RT_PRIVATE"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_route_table" "az1_internet" {
  vpc_id  = "${aws_vpc.main.id}"
  
  tags {
    Name = "AZ1_RT_INTERNET"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_route_table" "az2_internet" {
  vpc_id  = "${aws_vpc.main.id}"
  
  tags {
    Name = "AZ2_RT_INTERNET"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_route" "az1_polat" {
  destination_cidr_block = "${var.route_polat_cidr_block}"
  route_table_id = "${aws_route_table.az1_private.id}"
  gateway_id = "${aws_vpn_gateway.default.id}"
}

resource "aws_route" "az1_internet" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = "${aws_route_table.az1_internet.id}"
  gateway_id = "${aws_internet_gateway.default.id}"
}

resource "aws_route" "az2_polat" {
  destination_cidr_block = "${var.route_polat_cidr_block}"
  route_table_id = "${aws_route_table.az2_private.id}"
  gateway_id = "${aws_vpn_gateway.default.id}"
}

resource "aws_route" "az2_internet" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = "${aws_route_table.az2_internet.id}"
  gateway_id = "${aws_internet_gateway.default.id}"
}

resource "aws_route_table_association" "az1_external_01_to_az1_internet" { 
  subnet_id = "${aws_subnet.az1_external_01.id}"
  route_table_id = "${aws_route_table.az1_internet.id}"
}

resource "aws_route_table_association" "az2_external_01_to_az2_internet" { 
  subnet_id = "${aws_subnet.az2_external_01.id}"
  route_table_id = "${aws_route_table.az2_internet.id}"
}

resource "aws_route_table_association" "az1_management_01_to_az1_internet" { 
  subnet_id = "${aws_subnet.az1_management_01.id}"
  route_table_id = "${aws_route_table.az1_internet.id}"
}

resource "aws_route_table_association" "az2_management_01_to_az2_internet" { 
  subnet_id = "${aws_subnet.az2_management_01.id}"
  route_table_id = "${aws_route_table.az2_internet.id}"
}

resource "aws_route_table_association" "az1_presentation_01_to_az1_private" { 
  subnet_id = "${aws_subnet.az1_presentation_01.id}"
  route_table_id = "${aws_route_table.az1_private.id}"
}

resource "aws_route_table_association" "az2_presentation_01_to_az2_private" { 
  subnet_id = "${aws_subnet.az2_presentation_01.id}"
  route_table_id = "${aws_route_table.az2_private.id}"
}

resource "aws_route_table_association" "az1_service_01_to_az1_private" { 
  subnet_id = "${aws_subnet.az1_service_01.id}"
  route_table_id = "${aws_route_table.az1_private.id}"
}

resource "aws_route_table_association" "az2_service_01_to_az2_private" { 
  subnet_id = "${aws_subnet.az2_service_01.id}"
  route_table_id = "${aws_route_table.az2_private.id}"
}

resource "aws_route_table_association" "az1_database_01_to_az1_private" { 
  subnet_id = "${aws_subnet.az1_database_01.id}"
  route_table_id = "${aws_route_table.az1_private.id}"
}

resource "aws_route_table_association" "az2_database_01_to_az2_private" { 
  subnet_id = "${aws_subnet.az2_database_01.id}"
  route_table_id = "${aws_route_table.az2_private.id}"
}

resource "aws_route_table_association" "az1_dataservice_01_to_az1_private" { 
  subnet_id = "${aws_subnet.az1_dataservice_01.id}"
  route_table_id = "${aws_route_table.az1_private.id}"
}

resource "aws_route_table_association" "az2_dataservice_01_to_az2_private" { 
  subnet_id = "${aws_subnet.az2_dataservice_01.id}"
  route_table_id = "${aws_route_table.az2_private.id}"
}

resource "aws_vpc_dhcp_options" "polat" {
  domain_name = "${var.vpc_tag_env}"
  domain_name_servers = ["AmazonProvidedDNS"]
  ntp_servers = ["172.28.3.1"] 

  tags {
    Name = "DHCP"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_vpc_dhcp_options_association" "polat" {
  vpc_id  = "${aws_vpc.main.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.polat.id}"
}

resource "aws_eip" "az1_nat" { 
  vpc = true

  tags {
    Name = "EIP_AZ1_NAT"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_nat_gateway" "az1" { 
  allocation_id = "${aws_eip.az1_nat.id}"
  subnet_id = "${aws_subnet.az1_external_01.id}"

  tags {
    Name = "AZ1_NAT"
    Env = "${var.vpc_tag_env}"
  }

  depends_on = ["aws_eip.az1_nat"]
}

resource "aws_route" "az1_nat" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = "${aws_route_table.az1_private.id}"
  gateway_id = "${aws_internet_gateway.default.id}"
  nat_gateway_id = "${aws_nat_gateway.az1.id}"
}

resource "aws_eip" "az2_nat" { 
  vpc = true

  tags {
    Name = "EIP_AZ2_NAT"
    Env = "${var.vpc_tag_env}"
  }
}

resource "aws_nat_gateway" "az2" { 
  allocation_id = "${aws_eip.az2_nat.id}"
  subnet_id = "${aws_subnet.az2_external_01.id}"

  tags {
    Name = "AZ2_NAT"
    Env = "${var.vpc_tag_env}"
  }
  
  depends_on = ["aws_eip.az2_nat"]
}

resource "aws_route" "az2_nat" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = "${aws_route_table.az2_private.id}"
  gateway_id = "${aws_internet_gateway.default.id}"
  nat_gateway_id = "${aws_nat_gateway.az2.id}"
}