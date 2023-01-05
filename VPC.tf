provider "aws" {
        region = "us-east-1"
        access_key = "AKIA5******PW6G6AAXF"
        secret_key = "J8PuU7bpgSb*******Wsasxpy9PMhVyCfXCPlc2"
}
   resource "aws_vpc" "Main" {
   cidr_block       = "10.0.0.0/23"
   instance_tenancy = "default"
 }

 resource "aws_internet_gateway" "IGW" {
    vpc_id =  aws_vpc.Main.id
 }

 resource "aws_subnet" "publicsubnets" {
   vpc_id =  aws_vpc.Main.id
   cidr_block = "10.0.0.0/24"
 }

 resource "aws_subnet" "privatesubnets" {
   vpc_id =  aws_vpc.Main.id
   cidr_block = "10.0.1.0/24"
 }

resource "aws_route_table" "PublicRT" {
    vpc_id =  aws_vpc.Main.id
         route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
     }
 }

 resource "aws_route_table" "PrivateRT" {
   vpc_id = aws_vpc.Main.id
   route {
   cidr_block = "0.0.0.0/0"
   nat_gateway_id = aws_nat_gateway.NATgw.id
   }
 }

resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.publicsubnets.id
    route_table_id = aws_route_table.PublicRT.id
 }

resource "aws_route_table_association" "PrivateRTassociation" {
    subnet_id = aws_subnet.privatesubnets.id
    route_table_id = aws_route_table.PrivateRT.id
 }
resource "aws_eip" "nateIP" {
   vpc   = true
}
resource "aws_nat_gateway" "NATgw" {
   allocation_id = aws_eip.nateIP.id
   subnet_id = aws_subnet.publicsubnets.id
 }
