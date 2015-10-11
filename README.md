# nagios-plugins
A set of Nagios plugins I consider useful for myself.

Right now, you'll can find (with its further documentation):

## [check_rbl_hotmail](check_rbl_hotmail):
Check if any of IP's belonging to your mail servers are included in
Microsoft Live black lists. If you're blacklisted you won't able to
send any e-mail to @hotmail.com addresses, @live.com and so.
Microsoft has their own black lists, their rules and their policies, so
can't be checked by a third-party.

## [check_literal](check_literal):
Check if some defined string is present in a given URL. It can be
useful together with other classic web checks, such as checking if port
80/TCP is open, if Apache/Nginx/ whatever HTTP server is running, if
the right virtual host is enabled and the web server returns another
thing than a HTTP code.
