param(



[String] $p1,



[String] $p2,



[String] $p3,



[String] $a = "c:\temp\abc",



[String] $b = "c:\temp\xyz",



[String] $c = "c:\temp\def"



)



New-Item -Path $p1 -Itemtype Directory



New-Item -Path $p2 -Itemtype Directory



New-Item -Path $p3 -Itemtype Directory