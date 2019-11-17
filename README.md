# Logon Audit

Record log on and log off events with this PowerShell script.

Please consider donating to support my work:

* You can support me on a monthly basis [using Patreon.](https://www.patreon.com/mikegalvin)
* You can support me with a one-time payment [using PayPal](https://www.paypal.me/digressive) or by [using Kofi.](https://ko-fi.com/mikegalvin)

Tweet me if you have questions: [@mikegalvin_](https://twitter.com/mikegalvin_)

-Mike

## How to use

Put this script in the top level domain GPO, under user configuration, log on and log off PowerShell Scripts.
Use the command line switches to record a log on or log off event.

### Configuration

Configure the location of the log file. A hidden share is recommended, and "Authenticated Users" should
have share and file permissions set to full control.

``` txt
-Logon
```

Record a log on event to the configured log file.

``` txt
-Logoff
```

Record a log off event to the configured log file.
