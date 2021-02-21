/*
 This is an example template of resources if your spoke VPC has not already been attached.  If the Transit Gateway is not in the same AWS account as the spoke VPC, you will need to ensure
 that the Transit Gateway resource has already been shared with this AWS account.

 For an example of how to create a Transit Gateway in one AWS account, share it with a second AWS awccount
 see here: https://github.com/hashicorp/terraform-provider-aws/tree/master/examples/transit-gateway-cross-account-vpc-attachment
*/

// create the protected VPC attachment to transit gateway in the protected VPC account
resource "aws_ec2_transit_gateway_vpc_attachment" "spoke_vpc_tgw_vpc_attch1" {
  // This is created in the spoke VPC account.  Use the "provider" parameter if using multi-AWS account
  subnet_ids                                      = var.spoke_vpc_subnet_ids
  transit_gateway_id                              = var.transit_gateway_id
  vpc_id                                          = var.spoke_vpc_id
  transit_gateway_default_route_table_association = "false"
  transit_gateway_default_route_table_propagation = "false"
  appliance_mode_support                          = "true"
}

#create the route table for the protected VPC attachment
resource "aws_ec2_transit_gateway_route_table" "spoke_vpc_tgw_vpc_attch_rt1" {
  transit_gateway_id = var.transit_gateway_id
}

#associate the protected vpc attachment transit gateway route table to the protected vpc attachment using created resource
resource "aws_ec2_transit_gateway_route_table_association" "this" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke_vpc_tgw_vpc_attch1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spoke_vpc_tgw_vpc_attch_rt1.id
}