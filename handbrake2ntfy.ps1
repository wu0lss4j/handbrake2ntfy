## 2023.12.23
## Handbrake 2 ntfy.sh
## by Bruno (wu0lss4j@duck.com)
##
## 2024.12.08 barely an update
##
## Short PowerShell Core 7 script to send a notification using ntfy when your Handbrake encode is finished
## inspired by this post → https://github.com/HandBrake/HandBrake/discussions/5617
##
## Handbrake -- https://github.com/HandBrake
## ntfy.sh -- https://github.com/binwiederhier/ntfy
##
## BASIC SETUP
## 1. Drop this .ps1 script on your path
## 2. Go to Tools > Preferences > When Done > enable Send file to: > Browse to pwsh.exe
## 3. Enter this in arguments: handbrake2ntfy.ps1 {destination} encode
## Note: make sure you have ntfy listening to the word "encode"

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
