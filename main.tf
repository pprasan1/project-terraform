data "template_file" "windows_script" {
  template = "${file("${path.module}/test.ps1")}"
  
}
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
      source = "${data.template_file.windows_script.rendered}"
      destination = "C:\\temp\\"
  }


  // To copy whole folder
  #   provisioner "file" {
  #     source = "C:\\TEMP\\test.ps1"
  #     destination = "C:\\temp\\"
  #}

    provisioner "remote-exec" {
    inline = [        
            "powershell.exe C:\\temp\\test.ps1 -p1 'c:\\temp\\abc' -p2 'c:\\temp\\xyz'"
      ]
  }
  user_data =  <<EOF
    <powershell>
    # Install OpenSSH
    Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
    Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
    Start-Service sshd
    Set-Service -Name sshd -StartupType 'Automatic'
    </powershell>
EOF

}
