# check_literal

## What is it?
`check_literal` is a Bash script for working as a Nagios plugin, although
it can run without it.
It checks if some defined string (literal) appears in a given URL (also
defined) and return an exit code according to the result.

## How it works?

+ Place this script in your plugins directory, such as 
`/usr/lib/nagios/plugins`.
+ Also, `chmod +x`: Nagios user must be able to run it.
+ Add it in your `commands.cfg` with something like below:

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
+ Run `./check_literal` for a little bit more help.

## To do
+ You can extend pre-flight checks by validating parameters and values.
