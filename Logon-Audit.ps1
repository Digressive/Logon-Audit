<#PSScriptInfo

.VERSION 22.05.30

.GUID 8ce1ea39-7421-4190-8d59-267612fb0727

.AUTHOR Mike Galvin Contact: mike@gal.vin / twitter.com/mikegalvin_ / discord.gg/5ZsnJ5k

.COMPANYNAME Mike Galvin

.COPYRIGHT (C) Mike Galvin. All rights reserved.

.TAGS Logon Event Audit Microsoft Teams Webhook

.LICENSEURI

.PROJECTURI https://gal.vin/utils/logon-audit-utility/

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES

#>

<#
    .SYNOPSIS
    Logon Audit Utility - Really simple log on/off auditing utility

    .DESCRIPTION
    Log user log on and off activity to a txt file as well as Teams.

    .PARAMETER Logon
    Use this option to log a log on event.

    .PARAMETER Logoff
    Use this option to log a log off event.

    .PARAMETER Teams
    The path to a txt file containing the webhook to your Teams instance.
    Use this option to send a configured event to teams as well as a log file.

    .PARAMETER L
    The path to output the log file to.
    The file name will be Logon-Audit.log
    Do not add a trailing \ backslash.

    .PARAMETER Help
    Show usage help in the command line.

    .EXAMPLE
    Logon-Audit.ps1 -Logon -L \\server\share -Teams \\server\share\webhook.txt

    The above command will record a logon event for the currently logged on user to the log file and also to Teams.
#>

## Set up command line switches.
[CmdletBinding()]
Param(
    [alias("L")]
    [ValidateScript({Test-Path $_ -PathType 'Container'})]
    $LogPath,
    [Alias("Teams")]
    [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
    [string]$Twh,
    [switch]$Logon,
    [switch]$Logoff)

If ($PSBoundParameters.Values.Count -eq 0 -or $Help)
{
    Write-Host -Object "Usage:
    From a terminal run: [path\]Logon-Audit.ps1 -Logon OR -Logoff -L [path] -Teams [path\]webhook.txt
    The above command will record a logon event for the currently logged on user to the log file and also to Teams.
"
}

else {

    ## If logging is configured, set the log file name.
    If ($LogPath)
    {
        $LogFile = "Logon-Audit.log"
        $Log = "$LogPath\$LogFile"
    }

    ## Function to get date in specific format.
    Function Get-DateFormat
    {
        Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    }

    ## Function for logging.
    Function Write-Log($Type,$Evt)
    {
        If ($Type -eq "Logon")
        {
            If ($LogPath)
            {
                Add-Content -Path $Log -Encoding ASCII -Value "$(Get-DateFormat) [LOGON] $Evt"
            }
        }

        If ($Type -eq "Logoff")
        {
            If ($LogPath)
            {
                Add-Content -Path $Log -Encoding ASCII -Value "$(Get-DateFormat) [LOGOFF] $Evt"
            }
        }
    }

    # If the -logon switch is used, register it as a logon.
    If ($Logon)
    {
        Write-Log -Type Logon -Evt "Device: $env:COMPUTERNAME, Domain: $env:userdomain, Username: $env:username"

        If ($Twh)
        {
            $EStatus = "Logon"
        }
    }

    # If the -logon switch is used, register it as a logoff.
    If ($Logoff)
    {
        Write-Log -Type Logoff -Evt "Device: $env:COMPUTERNAME, Domain: $env:userdomain, Username: $env:username"

        If ($Twh)
        {
            $EStatus = "Logoff"
        }
    }

    # If the teams switch is used, get the webhook uri from the txt file.
    If ($Twh)
    {
        $uri = Get-Content $Twh

        # Create an array for the results.
        $ResultArr = @()

        $ResultArr += New-Object PSObject -Property @{
            facts = @(
                @{
                    name = 'User:'
                    value = $env:username
                },
                @{
                    name = 'Event:'
                    value = $EStatus
                },
                @{
                    name = 'Device:'
                    value = $env:COMPUTERNAME
                },
                @{
                    name = 'Domain:'
                    value = $env:userdomain
                }
            )
        }

        # If the result is not empty, put array together for sending to teams.
        If ($Null -ne $ResultArr)
        {
            $Body = ConvertTo-Json -Depth 8 @{
            text  = "An event occurred."
            sections = $ResultArr
            title = "Logon Audit Utility"
            }

            Invoke-RestMethod -Uri $Uri -Method Post -body $Body -ContentType 'application/json'
        }
    }
}

## End