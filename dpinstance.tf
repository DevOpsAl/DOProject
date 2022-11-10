resource "aws_instance" "dpinstance1" {
  ami  = "ami-08c40ec9ead489470" ### os: ubuntu 22.04; username: ubuntu
  instance_type  = "t2.micro"
  subnet_id  = aws_subnet.mysubnet1.id
  vpc_security_group_ids  = ["${aws_security_group.mysg1.id}"]
  key_name  = "LAB1\ Key" ### key must be created manually first and keep it on master
  tags  = {
    Name  = "DPAdminInstance"
  }
  user_data  = /storage/emulated/0/CTT/Scripts/dpinstall.sh
}