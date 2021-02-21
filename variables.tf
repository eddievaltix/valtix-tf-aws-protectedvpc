variable "transit_gateway_id" {
  description = "Transit Gateway id"
}

variable "route_cidr" {
  description = "cidr for destination_cidr_block for Transit Gateway spoke VPC attachment route table"
}

variable "spoke_vpc_subnet_ids" {
  description = "this is the list of spoke vpc subnets that are tagged for routes to be added to Valtix"
}

variable "valtix_services_vpc_tgw_attach_id" {
  description = "Transit Gateway VPC attachment ID of the Valtix Services VPC"
}

variable "valtix_services_vpc_route_table_id" {
  description = "Valtix Services VPC Transit Gateway VPC attachment route table ID"
}

variable "spoke_vpc_id" {
  description = "spoke VPC ID"
}

variable "spoke_vpc_cidr" {
  description = "spoke VPC cidr"
}

variable "spoke_vpc_attch_id" {
  description = "spoke VPC Transit Gateway attachment ID"
}

variable "spoke_vpc_attch_route_table_id" {
  description = "this is the spoke VPC attachment route table ID"
}

variable "spoke_vpc_subnet_ids" {
  description = "this is the list of spoke vpc subnets that are tagged for routes to be added to Valtix"
}
