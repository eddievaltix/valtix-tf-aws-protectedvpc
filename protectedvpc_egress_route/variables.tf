variable "transit_gateway_id" {
  description = "Transit Gateway id"
}

variable "valtix_datapath_subnet_route_table_id" {
  description = "route table id for the Valtix Datapath subnet route table"
}

variable "spoke_vpc_cidr" {
  description = "this is the cidr for the spoke vpc"
}
