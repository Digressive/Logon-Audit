# ----------------------------------------------------------------------------
# Script: Logon Audit
# Version: 1.0
# Author: Mike Galvin
# Contact: mike@gal.vin or twitter.com/mikegalvin_
# Date: 2019-09-28
# ----------------------------------------------------------------------------

# Create the switches to use
Param(
   [parameter(Mandatory=$False)]
   [switch]$Logon,
   [switch]$Logoff
)

$LogFile = "\\server\hidden-share$\logon-audit.log"

# If the -logon switch is used, log it as a logon.
If ($Logon)
{
    Add-Content -Path $LogFile -Value "$(Get-Date -format G),Device: $env:COMPUTERNAME,Domain: $env:userdomain,Username: $env:username,Event: Logon"
}

# If the -logon switch is used, log it as a logon.
If ($Logoff)
{
    Add-Content -Path $LogFile -Value "$(Get-Date -format G),Device: $env:COMPUTERNAME,Domain: $env:userdomain,Username: $env:username,Event: Logoff"
}

# End