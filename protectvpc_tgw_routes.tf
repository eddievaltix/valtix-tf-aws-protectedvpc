/*
 This resource is a transit gateway route for the spoke vpc attachment route table
 The destination_cidr_block will depend on type of flow

 For ingress - this is the cidr of the ingress services VPC:
    destination_cidr_block = ingress services VPC transit gateway attachment id
    transit_gateway_attachment_id = ingress services VPC transit gateway attachment id

 For east-west with AWS Gateway Load Balancer:
    you will need a resource for every cidr for all east-west flows to be inspected by Valtix east-west gateway
    destination_cidr_block= cidr of a VPC, another cloud or on-prem destination
    transit_gateway_attachment_id = eastwest services VPC transit gateway attachment id

 For egress:
    destination_cidr_block = 0.0.0.0/0
    transit_gateway_attachment_id = egress services VPC transit gateway attachment id
*/
resource "aws_ec2_transit_gateway_route" "tgw_route1" {
  destination_cidr_block         = var.route_cidr
  transit_gateway_attachment_id  = var.valtix_services_vpc_tgw_attach_id
  transit_gateway_route_table_id = var.spoke_vpc_attch_route_table_id
}

/*
 create a route in the services VPC transit gateway route table to the spoke VPC
 one will be required for each valtix services VPC to the spoke VPC
*/
resource "aws_ec2_transit_gateway_route" "services_vpc_route1" {
  destination_cidr_block         = var.spoke_vpc_cidr
  transit_gateway_attachment_id  = var.spoke_vpc_attch_id
  transit_gateway_route_table_id = var.valtix_services_vpc_route_table_id
}