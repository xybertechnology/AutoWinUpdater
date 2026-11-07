# AutoWinUpdater - Automate Weekly Updates

Write-Host The following updates are pending download and installation on this system: $env:COMPUTERNAME

Get-WindowsUpdate | Format-Table KB, Size, Title # FORMAT-TABLE IS USED TO EXCLUDE OR ONLY INCLUDE PROPERTIES THAT ARE NEEDED TO BE DISPLAYED BY THE COMMAND

Start-Sleep -Seconds 2

Write-Host Please save all work to avoid losing progress...

Start-Sleep -Seconds 2

Write-Host `nUpdating workstation...

Install-WindowsUpdate -AcceptAll

Write-Host `n$env:COMPUTERNAME is scheduled to restart automatically in 1 hour.

SHUTDOWN /R /T 3600

Write-Host `nExiting Script...

Start-Sleep -Seconds 10