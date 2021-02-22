locals {
  defaultroute_cidr = "0.0.0.0/0"
}

/*
 In Transit Gateway deployments, you should have default route -> Transit Gateway to allow Transit Gateway route tables to direct traffic flow to Valtix gateways
 If your Spoke VPCs are already attached to Transit Gateway and your subnet routes exist where 0.0.0.0/0 -> Transit Gateway, this resource is not required
*/

//this resource is created in the spoke VPC AWS account.  This route will be required for each subnet to be secured by Valtix
resource "aws_route" "route" {  
  // Use the provider option here in multi-AWS account scenarios
  route_table_id         = var.spoke_subnet_route_table.id
  destination_cidr_block = local.defaultroute_cidr
  transit_gateway_id     = var.transit_gateway_id
}
