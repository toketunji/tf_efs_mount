###########
# NETWORK #
###########

resource "aws_vpc" "kube_things" {
  cidr_block      =   "${var.vpc_cidr}"
  tags {
          Name    =   "${var.app_name}-${var.environ}"
          owner   =   "${var.owner}"
          environ =   "${var.environ}"
  }
}

resource "aws_internet_gateway" "default" {
    vpc_id    =   "${aws_vpc.kube_things.id}"
    tags {
      Name    =   "${var.app_name}-${var.environ}_Jenkind_IGW"
      owner   =   "${var.owner}"
    }
}

resource  "aws_route_table" "main_table" {
  vpc_id    =   "${aws_vpc.kube_things.id}"
  route {
    cidr_block    =   "0.0.0.0/0"
    gateway_id    =   "${aws_internet_gateway.default.id}"
  }
}




resource "aws_route_table_association" "jenkins_public" {
  subnet_id             =       "${element ( aws_subnet.jenkins_public.*.id, count.index)}"
  route_table_id        =       "${aws_route_table.main_table.id}"
  count                 =       "${length( split ( ",", lookup (var.azs, var.region ) ) ) }"
}



