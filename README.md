# Logon Audit Utility

## Really simple log on/off auditing utility

For full change log and more information, [visit my site.](https://gal.vin/utils/logon-audit-utility/)

Logon Audit Utility is available from:

* [GitHub](https://github.com/Digressive/Logon-Audit)
* [The Microsoft PowerShell Gallery](https://www.powershellgallery.com/packages/Logon-Audit)

Please consider supporting my work:

* Sign up using [Patreon](https://www.patreon.com/mikegalvin).
* Support with a one-time donation using [PayPal](https://www.paypal.me/digressive).

Please report any problems via the ‘issues’ tab on GitHub.

Thanks
-Mike

## Features and Requirements

* The utility should be run on a client machine.
* It is ideally triggered as a logon/logoff script by Group Policy.
* Any files that the script needs to access should be accessible from a client device.
* It can be used to log to a file, send to a webhook or both.
* The utility requires at least PowerShell 5.0.
* Tested on Windows 11, Windows 10, Windows Server 2022, Windows Server 2019, Windows Server 2016 and Windows Server 2012 R2.

## Configuration

Here’s a list of all the command line switches and example configurations.

| Command Line Switch | Description | Example |
| ------------------- | ----------- | ------- |
| -Logon | Use this option to log a log on event. | N/A |
| -Logoff | Use this option to log a log off event. | N/A |
| -Webhook | The txt file containing the URI for a webhook to send the log file to. | [path\]webhook.txt |
| -L | The path to output the log file to. | [path\logs] |
| -Help | Display usage information. No arguments also displays help. | N/A |

## Example

``` txt
[path\]Logon-Audit.ps1 -Logon -L [path]
```

The above command will record a logon event for the currently logged on user to the log file and also to Teams.

## Change Log

### 2023-04-28: Version 23.04.28

* Changed the -Teams switch to -Webhook to better represent it's function.

### 2022-06-14: Version 22.05.30

* Added checks and balances to help with configuration as I'm very aware that the initial configuration can be troublesome. Running the utility manually is a lot more friendly and step-by-step now.
* Added -Help to give usage instructions in the terminal. Running the script with no options will also trigger the -help switch.
* Cleaned user entered paths so that trailing slashes no longer break things or have otherwise unintended results.
* Added -LogRotate [days] to removed old logs created by the utility.
* Streamlined config report so non configured options are not shown.
* Added donation link to the ASCII banner.
* Cleaned up code, removed unneeded log noise.

### 2021-12-08: Version 21.12.08

* Configured logs path now is created, if it does not exist.
* Added OS version info.
* Added Utility version info.
* Added Hostname info.
* Changed a variable to prevent conflicts with future PowerShell versions.

### 2020-03-12: Version 20.03.12 'Chick'

* Added option to send an event to Microsoft Teams.
* Refactored code.
* Fully backwards compatible.

### 2019-09-28 v1.0

* Initial public release.
