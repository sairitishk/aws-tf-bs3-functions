resource "local_file" "ansinv" {
    content = templatefile("inv.tpl",

    {
        clientip01 = aws_instance.web-1.0.private_ip
        clientip02 = aws_instance.web-1.1.private_ip
        clientip03 = aws_instance.web-1.2.private_ip
    }
    )
    filename = "inventory"
  
}