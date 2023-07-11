resource "aws_security_group" "acesso_dev"{
    name = "acesso_dev"
    description = "grupo Dev"
    ingress{
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
    egress{
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
    tags = {
        name = "acesso_dev"
    }
}