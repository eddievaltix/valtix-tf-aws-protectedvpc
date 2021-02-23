# Valtix Terraform Protected VPC Example Template
This example template are the steps needed to secure a spoke VPC in a Valtix AWS Transit Gateway deployment.  
Consult the Valtix Protected VPC technote to see all the steps that are orchestrated by Valtix UI Protected VPC feature.  Terraform users are expected to orchestrate this using the Terraform AWS resource provider.

We've provided these examples because each customer environment is different and customers can selectively use the templates that they require depending on whether resources are already deployed.

## protectedvpc_tgw_attach
This template example creates the Transit Gateway VPC attachment for the spoke VPC as well as a Transit Gateway VPC attachment route table associated with it

## protectedvpc_tgw_routes
This template example shows how to create Transit Gateway VPC attachment routes for both the Spoke VPC Transit Gateway attachment as well as the Valtix Gateway Transit Gateway attachment.  This is dependant on Transit Gateway spoke VPC attachment.

## protectedvpc_subnet_routes
This template example shows how to create subnet routes in the spoke VPC to Transit Gateway to allow Transit Gateway routes to direct traffic flow to Valtix Gateways.  This is dependant on Transit Gateway spoke VPC attachment.

## protectedvpc_egress_route
This template example shows how to update the Valtix Egress Services VPC datapath subnet route table to add the spoke VPC CIDR for each availability zone.  This is the return route for traffic originating from spoke VPC to Valtix Gateway going outbound to the internet.

## Example Usage
```hcl
git clone github.com/eddievaltix/valtix-tf-aws-protectedvpc
```
modify examples as required
