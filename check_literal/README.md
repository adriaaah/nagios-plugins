# check_literal

## What is it?
`check_literal` is an script for working as a Nagios plugin, although
it can run without it.
It checks if some defined string (literal) is presnt in a given URL
(also defined) and returns an exit code according to the result.
`check_literal` does the same work than [check_strings](https://exchange.nagios.org/directory/Plugins/System-Metrics/Environmental/check_strings/details)
using Bash instead of Perl, and using cURL instead of Lynx.

## How it works?

+ Place this script in your plugins directory, such as
`/usr/lib/nagios/plugins`.
+ Also, `chmod +x`: Nagios user must be able to run it.

## Usage

`check_literal -H <hostname> -p <path> -s "<string>"`

Available flags:
-h: Display help.
-H: Hostname. Required.
-p: Path. Required. It refers to relative path, without the starting
slash bar. So, if your URL is `http://example.com/page.html`, the path
will be `page.html`.
-s: String. Required. String to check. If it contains blank spaces,
put them between double quotes ("").

## Nagios integration

+ Declare it in your `commands.cfg` file with something like below:

```
define command{
	command_name	check_literal
	command_line	/usr/lib/nagios/plugins/check_literal -H $ARG1$ -p $ARG2$ -s $ARG3$
	}
```

+ And after use it as shown below:

```
define host{
        use                     generic-host
        host_name               myhost
        alias                   My host
        address                 www.example.com
        }

define service{
        use                             generic-service
        host_name                       myhost
        service_description             Check my favourite string
	check_command			check_literal!$HOSTADDRESS$!the/page/to/check.html!"Howdy"
        }
```

## To do
+ You can extend pre-flight checks by validating parameters and values.
