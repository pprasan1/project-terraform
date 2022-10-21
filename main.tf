resource "null_resource" "PowerShellScriptRunFirstTime" {



    provisioner "remote-exec" {

    //command = "C:\\Users\\Administrator\\FirstScript.ps1 -Schedule"

    //interpreter = ["PowerShell"]

    connection {

      type     = "ssh"

      user     = "Administrator"

      password = "N1etEt1(Nj(flmqF()1zefzG*d7CfnOq"

      host     = "3.86.93.154"

      script_path = "test.ps1\\terraform_%RAND%.cmd"

      target_platform = "windows"

    }



    inline = [        

    //      "powershell.exe -ExecutionPolicy Bypass -File C:\\Users\\Administrator\\FirstScript.ps1"

            "powershell -File C:/Users/Administrator/SecondScript.ps1 -p1 'c:\\temp\\abc' -p2 'c:\\temp\\xyz' -p3 'c:\\temp\\def'"

      ]

  }

}
