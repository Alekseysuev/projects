resource "aws_security_group" "region" {
  name        = "${var.project_name}-${var.region}-sg"
  description = "Open access within this region"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${aws_vpc.main.cidr_block}"]
  }

  tags = {
    Name = "${var.project_name}-${var.region}-sg"
  }
}

resource "aws_security_group" "internal-all" {
  name        = "${var.project_name}-internal-all-sg"
  description = "Open access within the full internal network"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${lookup(var.project_cidrs, var.project_name)}"]
  }

  tags = {
    Name = "${var.project_name}-internal-all-sg"
  }
}