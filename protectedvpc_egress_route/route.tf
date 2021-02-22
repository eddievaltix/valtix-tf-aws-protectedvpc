/*
For Egress, a route to target the spoke VPC CIDR is required in the Valtix Egress Services VPC datapath route table in each Services VPC availability zone
*/ 

// this resource is required for the Valtix datapath subnet route table in each availability zone for the Valtix Services VPC
// by default Valtix tags the route table with name: <services vpc name>-datapath-<aws az>-rt

resource "aws_route" "route" {
  route_table_id         = var.valtix_datapath_subnet_route_table_id
  destination_cidr_block = var.spoke_vpc_cidr
  transit_gateway_id     = var.transit_gateway_id
}

