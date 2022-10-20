resource "null_resource" "PowerShellScriptRunFirstTime" {

    connection {
      type     = "ssh"
      user     = "Administrator"
      password = "N1etEt1(Nj(flmqF()1zefzG*d7CfnOq"
      host     = "3.86.93.154"
      # script_path = "c:\\windows\\temp\\terraform_%RAND%.ps1"
      target_platform = "windows"
    }

    provisioner "remote-exec" {
    inline = [        
      "echo hello world"
      ]
  }

    // To copy all the contents inside a folder
  provisioner "file" {
      source = "test.ps1"
      destination = "C:\\"
  }


  // To copy whole folder
  #   provisioner "file" {
  #     source = "C:\\TEMP\\test.ps1"
  #     destination = "C:\\temp\\"
  #}

    provisioner "remote-exec" {
    inline = [        
            "powershell C:\\test.ps1 -p1 'c:\\temp\\abc' -p2 'c:\\temp\\xyz'"
      ]
  }

}
