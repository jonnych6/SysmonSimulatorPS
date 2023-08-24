# declare a param block to accept a variable name as an input
param (
  [string]$name
)

Copy-Item -Path $env:windir\System32\WindowsPowerShell\v1.0\powershell.exe -Destination .\$name.exe

#Start a separate PowerShell window with the given name
Start-Process -FilePath “$name.exe” -WindowStyle Hidden -ArgumentList “-c Exit” -PassThru
