# Logon Audit Utility

Really simple log on/off auditing utility

```txt
__     _____   ____   _____  __  __     ___  __ __ _____ __ _____
||    ((   )) (( ___ ((   )) ||\\||    ||=|| || || ||  ) ||  ||
||__| _\\_//__ \\_|| _\\_//__|| \||    || || \\_// ||_// ||  ||
|| ||  ||   || ||    ||  ||   \\//
\\_//  ||   || ||__| ||  ||    //   Mike Galvin   https://gal.vin
                                         Version 20.07.17
```

For full instructions and documentation, [visit my site.](https://gal.vin/posts/logon-audit-utility/)

Please consider donating to support my work:

* Sign up [using Patreon.](https://www.patreon.com/mikegalvin)
* Support with a one-time payment [using PayPal.](https://www.paypal.me/digressive)

Logon Audit Utility can also be downloaded from:

* [The Microsoft PowerShell Gallery](https://www.powershellgallery.com/packages/Logon-Audit)

Join the [Discord](http://discord.gg/5ZsnJ5k) or Tweet me if you have questions: [@mikegalvin_](https://twitter.com/mikegalvin_)

-Mike

## Features and Requirements

* The utility is meant to be run on the client machine.
* It is ideally triggered as a logon/logoff script by a Group Policy.
* Any files that the script needs to access should be accessible from a client device.
* It can be used to log to a file, send to Teams or both.
* The utility requires at least PowerShell 5.0.
* This utility has been tested on Windows 10, Windows Server 2019, Windows Server 2016 and Windows Server 2012 R2.

### Configuration

Here’s a list of all the command line switches and example configurations.

| Command Line Switch | Description | Example |
| ------------------- | ----------- | ------- |
| -Logon | Use this option to log a log on event. | N/A |
| -Logoff | Use this option to log a log off event. | N/A |
| -Teams | The path to a txt file containing the webhook to your Teams instance. Use this option to send a configured event to teams as well as a log file. | \\\server\share\webhook.txt |
| -L | The path to output the log file to. The file name will be Logon-Audit.log. Do not add a trailing \ backslash. | \\\server\share |

### Example

``` txt
Logon-Audit.ps1 -Logon -L \\server\share -Teams \\server\share\webhook.txt
```

The above command will record a logon event for the currently logged on user to the log file and also to Teams.
