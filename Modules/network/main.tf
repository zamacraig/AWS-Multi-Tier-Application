resource "aws_vpc" "app_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "finance"
  }
}


resource "aws_vpc_endpoint" "sns_endpoint" {
  vpc_id            = aws_vpc.app_vpc.id
  service_name      = var.sns_servicename
  vpc_endpoint_type = "Interface"
  subnet_ids        = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]

  security_group_ids = [
    aws_security_group.sg_private.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "private_vpc_endpoint"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = var.private_finance_subnet_a_cidr
  availability_zone = var.vpc_zone_1

  tags = {
    Name = "Private Subnet A"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = var.private_finance_subnet_b_cidr
  availability_zone = var.vpc_zone_2

  tags = {
    Name = "Private Subnet B"
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = var.public_finance_subnet_a_cidr
  availability_zone = var.vpc_zone_1

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = var.public_finance_subnet_b_cidr
  availability_zone = var.vpc_zone_2

  tags = {
    Name = "Public Subnet B"
  }
}

resource "aws_db_subnet_group" "private_subnet_group" {
  name       = "private_subnet_group"
  subnet_ids = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]

  tags = {
    Name = "private_subnet_group"
  }
}

resource "aws_db_subnet_group" "public_subnet_group" {
  name       = "public_subnet_group"
  subnet_ids = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]

  tags = {
    Name = "public_subnet_group"
  }
}

resource "aws_security_group" "sg_private" {
  name        = "private_security_group"
  description = "Allow traffic only from vpc"
  vpc_id      = aws_vpc.app_vpc.id

  tags = {
    Name = "Private Security Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_private_allow_db_port" {
  security_group_id = aws_security_group.sg_private.id
  cidr_ipv4         = aws_vpc.app_vpc.cidr_block
  from_port         = var.private_subnet_port
  ip_protocol       = "tcp"
  to_port           = var.private_subnet_port
}

resource "aws_vpc_security_group_egress_rule" "sg_private_allow_vpc_traffic" {
  security_group_id = aws_security_group.sg_private.id
  cidr_ipv4         = aws_vpc.app_vpc.cidr_block
  ip_protocol       = "-1"
}

resource "aws_security_group" "sg_public" {
  name        = "public_security_group"
  description = "Allow traffic only from vpc"
  vpc_id      = aws_vpc.app_vpc.id

  tags = {
    Name = "Public Security Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_public_allow_https_port" {
  security_group_id = aws_security_group.sg_public.id
  cidr_ipv4         = var.internet_cidr
  from_port         = var.public_subnet_port
  ip_protocol       = "tcp"
  to_port           = var.public_subnet_port
}

resource "aws_vpc_security_group_egress_rule" "sg_public_allow_vpc_traffic" {
  security_group_id = aws_security_group.sg_public.id
  cidr_ipv4         = var.internet_cidr
  ip_protocol       = "-1"
}

# Create Route Table
resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }

  tags = {
    Name = "public_subnet_route_table"
  }
}

# Associate Route Table with Public Subnet A
resource "aws_route_table_association" "public_subnet_a_association" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}

# Associate Route Table with Public Subnet B
resource "aws_route_table_association" "public_subnet_b_association" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}

# Create routes between private subnet and public subnet
resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "private_subnet_route_table"
  }
}

# Associate Route Table with Private Subnet
resource "aws_route_table_association" "private_subnet_a_association" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}

# Associate Route Table with Private Subnet
resource "aws_route_table_association" "private_subnet_b_association" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "App Internet Gateway"
  }
}
