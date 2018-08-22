#### creeate routing ######

#### public routing####

resource "aws_internet_gateway" "public_access" {
  vpc_id = "${aws_vpc.elk.id}"

  tags {
    Name = "ELK Gateway"
  }
}


resource "aws_route_table" "public_routing" {
  vpc_id = "${aws_vpc.elk.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.public_access.id}"
  }

  tags {
    Name = "ELK Public Routing"
  }
}


## associate with public subnet

resource "aws_route_table_association" "public_Subnet_association" {
  subnet_id      = "${aws_subnet.elkpublic_subnet.id}"
  route_table_id = "${aws_route_table.public_routing.id}"

}


### private routing
resource "aws_route_table" "private_routing" {
  vpc_id = "${aws_vpc.elk.id}"

  tags {
    Name = "ELK Private Routing"
  }
}


## associate with public subnet

resource "aws_route_table_association" "private_Subnet_association" {
  subnet_id      = "${aws_subnet.elkprivate_subnet.id}"
  route_table_id = "${aws_route_table.private_routing.id}"

}













