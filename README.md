# Logon Audit Utility

Really simple log on/off auditing utility

For full change log and more information, [visit my site.](https://gal.vin/utils/logon-audit-utility/)

Logon Audit Utility is available from:

* [GitHub](https://github.com/Digressive/Logon-Audit)
* [The Microsoft PowerShell Gallery](https://www.powershellgallery.com/packages/Logon-Audit)

Please consider supporting my work:

* Sign up using [Patreon](https://www.patreon.com/mikegalvin).
* Support with a one-time donation using [PayPal](https://www.paypal.me/digressive).

If you’d like to contact me, please leave a comment, send me a [tweet or DM](https://twitter.com/mikegalvin_), or you can join my [Discord server](https://discord.gg/5ZsnJ5k).

-Mike

## Features and Requirements

* The utility should be run on a client machine.
* It is ideally triggered as a logon/logoff script by Group Policy.
* Any files that the script needs to access should be accessible from a client device.
* It can be used to log to a file, send to Teams or both.
* The utility requires at least PowerShell 5.0.
* This utility has been tested on Windows 11, Windows 10, Windows Server 2022, Windows Server 2019, Windows Server 2016 and Windows Server 2012 R2.

## Configuration

Here’s a list of all the command line switches and example configurations.

| Command Line Switch | Description | Example |
| ------------------- | ----------- | ------- |
| -Logon | Use this option to log a log on event. | N/A |
| -Logoff | Use this option to log a log off event. | N/A |
| -Teams | Use this option to send events to Teams via webhook. | [path\webhook.txt] |
| -L | The path to output the log file to. | [path\logs] |
| -Help | Display usage information. No arguments also displays help. | N/A |

## Example

``` txt
[path\]Logon-Audit.ps1 -Logon -L [path]
```

The above command will record a logon event for the currently logged on user to the log file and also to Teams.
