variable "transit_gateway_id" {
  description = "Transit Gateway id"
}

variable "spoke_vpc_id" {
  description = "spoke VPC id"
}

variable "spoke_vpc_subnet_ids" {
  description = "spoke vpc subnet ids of the subnets to associate with the transit gateway."
}
