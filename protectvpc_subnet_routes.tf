locals {
  defaultroute_cidr = "0.0.0.0/0"
}

// In Transit Gateway deployments, you should have default route -> Transit Gateway to allow Transit Gateway route tables to direct traffic flow to Valtix gateways
// If your Spoke VPCs are already attached to Transit Gateway and your subnet routes exist where 0.0.0.0/0 -> Transit Gateway, this resource is not required

// find all route tables that are associated with the customer spoke VPC subnet
data "aws_route_table" "subnet_route_table" {
  provider  = aws.protected
  for_each  = var.spoke_vpc_subnet_ids
  subnet_id = each.value
}

//this resource is created in the spoke VPC AWS account.  Use the provider option here in multi-AWS account scenarios
resource "aws_route" "route" {
  for_each               = var.spoke_vpc_subnet_ids
  route_table_id         = data.aws_route_table.subnet_route_table[each.key].id
  destination_cidr_block = local.defaultroute_cidr
  transit_gateway_id     = var.transit_gateway_id
}
