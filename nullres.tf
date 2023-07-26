resource "null_resource" "provs" {
  count = 3
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("test.pem")
      host        = element(aws_instance.web-1.*.public_ip, count.index)
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo apt update",
      "sudo apt install -y unzip",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("test.pem")
      host        = element(aws_instance.web-1.*.public_ip, count.index)
    }

  }

  provisioner "local-exec" {
    command = <<EOH
        echo "${element(aws_instance.web-1.*.public_ip, count.index)}" >> public_ip.txt
        echo "${element(aws_instance.web-1.*.private_ip, count.index)}" >> private_ip.txt
        EOH

  }


}
