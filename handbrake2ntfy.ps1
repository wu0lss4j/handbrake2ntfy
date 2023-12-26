## 2023.12.23
## Handbrake 2 ntfy.sh
## by Bruno (wu0lss4j@duck.com)
##
## Short PowerShell Core 7 script to send a notification using ntfy when your Handbrake encode is finished
##
## Handbrake -- https://github.com/HandBrake
## ntfy.sh -- https://github.com/binwiederhier/ntfy

## TODO
## add arg%3 for allow the specification of a custom ntfy server

## How to run:
## Open PowerShell Core (version 7.x or greater)
## ./handbrake2ntfy.ps1 %arg1 %arg2
## %arg1 = FileName
## %arg2 = Topic (optional, default is "mytopic")

param(
    [Parameter(Mandatory=$true)]
    [string]$FileName,
    [Parameter(Mandatory=$false)]
    [string]$Topic = 'mytopic'
)

Invoke-RestMethod `
  -Method 'Post' `
  -Uri https://ntfy.sh/$topic `
  -Body "Encode Finished: $FileName" -UseBasicParsing