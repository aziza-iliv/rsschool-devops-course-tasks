resource "aws_instance" "bastion" {
ami                    = var.ami_id
instance_type          = "t2.micro"
subnet_id              = aws_subnet.public_1.id
vpc_security_group_ids = [aws_security_group.bastion_sg.id]
key_name               = aws_key_pair.aziza_key.key_name

tags = {
Name = "Bastion Host"
}
} 

resource "aws_eip" "nat_eip" {
  depends_on = [ aws_internet_gateway.igw ]
}
