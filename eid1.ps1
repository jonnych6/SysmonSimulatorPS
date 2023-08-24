# declare a param block to accept the child process name, the parent process name, and the message as inputs
param (
  [string]$child = "child",
  [string]$parent = "parent",
  [string]$msg = "Hello"
)

# append .exe to the process names
$child = $child + ".exe"
$parent = $parent + ".exe"

# copy cmd.exe into new files with the process names
Copy-Item -Path C:\Windows\System32\cmd.exe -Destination $child
Copy-Item -Path C:\Windows\System32\cmd.exe -Destination $parent

# start the parent process with the child process and the message as arguments
Start-Process -FilePath .\$parent -ArgumentList "/c", "$child ""echo $msg""" -Wait -PassThru